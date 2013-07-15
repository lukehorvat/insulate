module Insulate
  module ActionControllerFilters
    def self.included base
      base.module_eval do
        after_filter :inject_script, :if => :html_response_from_render?
      end
    end

    protected

    def html_response_from_render?
      [nil, 'text/html'].include?(response.content_type) && self.status != 302
    end

    def inject_script
      doc = Nokogiri::HTML response.body
      head = doc.at_css 'head'
      if head
        # inject the following script as the first child of the <head>
        script = doc.create_element 'script', script_contents(controller_path, action_name), :type => 'text/javascript'

        head_children = head.children
        if head_children.empty?
          head.add_child script
        else
          head_children.before script
        end

        # replace the response
        response.body = doc.to_html
      end
    end

    private

    def script_contents(controller, action)
      "window.INSULATE_PAGE_ID='#{controller}##{action}';"
    end
  end

  ::ActionController::Base.send :include, ActionControllerFilters
end
