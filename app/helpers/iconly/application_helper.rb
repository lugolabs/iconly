module Iconly
  module ApplicationHelper
    def title(content)
      content_for :title do
        content
      end
    end
  end
end
