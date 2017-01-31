module ApplicationHelper
  include Iconly::SessionsHelper, Iconly::Engine.routes.url_helpers, Iconly::ApplicationHelper
end
