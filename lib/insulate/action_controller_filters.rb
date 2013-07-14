module Insulate
  module ActionControllerFilters
    def self.included base
      base.module_eval do
        prepend_view_path "#{Insulate.root}/app/views/"
        after_filter :update_callback, :if => :html_response_from_render?
      end
    end

    def html_response_from_render?
      [nil, 'text/html'].include?(response.content_type) && self.status != 302
    end

    def update_callback
      insulate_script = view_context.render(
        :partial => 'insulate/callback',
        :locals => {
          :controller => controller_path,
          :action => action_name
      })

      before_body_end_index = response_body[0].rindex('</body>')

      if before_body_end_index.present?
        before_body_end_content = response_body[0][0, before_body_end_index].html_safe
        after_body_end_content = response_body[0][before_body_end_index..-1].html_safe

        response_body[0] = before_body_end_content + insulate_script + after_body_end_content

        response.body = response_body[0]
      else
        # If body tag is not present, append insulate_script in the response body
        response_body[0] += insulate_script
        response.body = response_body[0]
      end
    end
  end

  ::ActionController::Base.send :include, ActionControllerFilters
end
