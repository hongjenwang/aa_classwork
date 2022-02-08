class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        token = reset_session_token!
        @user = User.new(params.require(:user).permit(:user_name, :password_digest, :session_token))
        @user[session_token] = token
        if @user.save
            render json: @user
        else
            render @user.errors.full_messages
        end
    end
end
