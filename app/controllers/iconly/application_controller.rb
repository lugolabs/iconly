module Iconly
  class ApplicationController < ActionController::Base
    include SessionsHelper

    protect_from_forgery with: :exception
    before_action :require_sign_in
  end
end
