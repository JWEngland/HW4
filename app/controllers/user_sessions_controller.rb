class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user = User.find_by(username: params[:user_session][:username])

    if @user&.authenticate(params[:user_session][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid username or password.'
      @user_session = UserSession.new(username: params[:user_session][:username])
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully.'
  end
end
