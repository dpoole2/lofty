class ApplicationController < ActionController::Base
    before_action :autheticate
    
    def autheticate
        redirect_to new_session_path if current_user.blank?
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
end
