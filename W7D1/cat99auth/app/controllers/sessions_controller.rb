class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user.nil?
      render json: 'Wrong credentials' 
    else
      login!(@user)
      reset_session_token!
      redirect_to user_url(@user)
    end

  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
  end
end
