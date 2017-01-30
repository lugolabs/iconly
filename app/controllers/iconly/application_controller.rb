module Iconly
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # Session helpers
    include SessionsHelper
  end
end
