class UserSessionsController < ApplicationController
  rescue_from ActionController::RoutingError, with: :handle_routing_error

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user_session][:email])

    if @user&.authenticate(params[:user_session][:password])
      session[:user_id] = @user.id
      redirect_to places_path, notice: 'Logged in successfully.'
    else
      if @user.nil?
        flash.now[:alert] = 'Invalid username.'
      else
        flash.now[:alert] = 'Invalid password.'
      end
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  private

  def handle_routing_error
    flash[:error] = 'Invalid username.'
    redirect_to login_path
  end
end
