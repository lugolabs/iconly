class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  protected

  def set_current_user
    session[:user_id] = Iconly::User.first.id
  end
end
