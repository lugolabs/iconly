module Iconly
  module ApplicationHelper
    def title(content)
      content_for :title do
        content
      end
    end

    def render_flash
      content_tag :div, class: 'container flash-container' do
        flash.each do |name, msg|
          div = content_tag :div, class: alert_class_name(name) do
            btn = content_tag :button, type: 'button', class: 'close', 'data-dismiss' => 'alert' do
              content_tag :span, '&times;'.html_safe
            end
            concat btn
            concat sanitize(msg)
          end
          concat div
        end
      end
    end

    private

    def alert_class_name(flash_name)
      class_name = case flash_name
                   when 'notice' then 'success'
                   when 'error' then 'danger'
                   else flash_name
                   end
      "alert alert-#{class_name} mb-4"
    end
  end
end
