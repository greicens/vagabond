class SessionsController < ApplicationController

  def create
    user_params = params.require(:user).permit(:email, :password,)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      redirect_to '/'
      # flash[:error] = "Incorrect email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to '/'
  end

end
