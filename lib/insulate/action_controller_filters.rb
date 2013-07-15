module Insulate
  module ActionControllerFilters
    def self.included base
      base.module_eval do
        prepend_view_path "#{Insulate.root}/app/views/"
        after_filter :inject_scripts, :if => :html_response_from_render?
      end
    end

    protected

    def html_response_from_render?
      [nil, 'text/html'].include?(response.content_type) && self.status != 302
    end

    def inject_scripts
      doc = Nokogiri::HTML response.body
      head = doc.at_css 'head'
      body = doc.at_css 'body'
      if head && body
        # inject the init script so it's the first child of the <head>
        init_script = view_context.render 'insulate/init'

        head_children = head.children
        if head_children.empty?
          head.add_child init_script
        else
          head_children.before init_script
        end

        # inject the callback script so it's the last child of the <body>
        callback_script = view_context.render(
          :partial => 'insulate/callback',
          :locals => { :controller => controller_path, :action => action_name })

        body.add_child callback_script

        # replace the response
        response.body = doc.to_html
      end
    end
  end

  ::ActionController::Base.send :include, ActionControllerFilters
end
