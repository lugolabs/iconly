module ApplicationHelper
  include Iconly::ApplicationHelper
  include Iconly::Engine.routes.url_helpers
  include Iconly::SessionsHelper
end
