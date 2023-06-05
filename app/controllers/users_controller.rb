class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
  
    if @user.save
      # Handle successful user creation
      redirect_to root_path, notice: 'User was successfully created.'
    else
      # Handle validation errors
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end