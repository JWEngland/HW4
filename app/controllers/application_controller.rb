class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      flash[:alert] = 'Please log in.'
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
