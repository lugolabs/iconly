module Iconly
  module ApplicationHelper
    def title(content)
      content_for :title do
        content
      end
    end

    def render_flash
      content_tag :div, class: 'container' do
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

    def logout_path
    end

    def login_path
    end

    private

    def alert_class_name(flash_name)
      class_name = case flash_name
                   when 'notice' then 'success'
                   when 'error' then 'danger'
                   else flash_name
                   end
      "alert alert-#{class_name} m-b-2"
    end
  end
end
