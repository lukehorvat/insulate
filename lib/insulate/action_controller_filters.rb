module Insulate
  module ActionControllerFilters
    def self.included base
      base.module_eval do
        prepend_view_path "#{Insulate.root}/app/views/"
        after_filter :inject_callback_script, :if => :html_response_from_render?
      end
    end

    protected

    def html_response_from_render?
      [nil, 'text/html'].include?(response.content_type) && self.status != 302
    end

    def inject_callback_script
      callback_script = view_context.render(
        :partial => 'insulate/callback',
        :locals => { :controller => controller_path, :action => action_name })

      body_closing_tag_index = response_body[0].rindex('</body>')
      if body_closing_tag_index.present?
        # Insert callback_script just before </body> tag
        response_body[0].insert body_closing_tag_index, callback_script
      else
        # Append callback_script in the response body
        response_body[0].concat callback_script
      end
    end
  end

  ::ActionController::Base.send :include, ActionControllerFilters
end
