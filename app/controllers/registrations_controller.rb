class RegistrationsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      session[:user_id] = @user.id
      redirect_to places_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end
  
end
