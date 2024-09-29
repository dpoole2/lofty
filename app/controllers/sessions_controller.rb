class SessionsController < ApplicationController
    skip_before_action :autheticate

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])
        if @user
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:alert] = "Incorrect Credentials..."
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
