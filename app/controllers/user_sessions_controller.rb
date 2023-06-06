def create
  @user = User.find_by(username: params[:user][:username])

  if @user&.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Logged in successfully.'
  else
    flash.now[:alert] = 'Invalid username or password.'
    render :new
  end
end
