module Iconly
  module SessionsHelper
    protected

    def logout_path
      '/'
    end

    def login_path
      '/'
    end

    def current_user
      unless @current_user
        if (user_id = session[:user_id] || cookies.signed[:user_id])
          @current_user = Iconly::User.find_by(id: user_id)
        end
      end
      @current_user
    end

    def sign_in(user_id)
      session[:user_id]        = user_id
      cookies.signed[:user_id] = user_id
    end

    def sign_out
      session.delete(:user_id)
      cookies.signed[:user_id] = nil
    end

    def signed_in?
      current_user.present?
    end

    def require_sign_in
      return if signed_in?
      session[:redirect_after_login] = request.original_fullpath
      flash[:danger] = 'You need to be signed in to access this page.'
      redirect_to root_path
    end
  end
end
