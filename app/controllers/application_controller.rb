class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
  end

  before_action :set_current_user

  private

  def set_current_user
    @current_user_instance = User.find_by(id: session[:user_id])
  end
  
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
