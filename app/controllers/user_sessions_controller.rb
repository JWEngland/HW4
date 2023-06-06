class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end
  

  def create
    @user = User.find_by(email: params[:user][:email])
  
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to places_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :new
    end
  end
  

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully.'
  end
  

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
