class UsersController < ApplicationController
  # before_action :require_login, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:sign_up_error] = @user.errors.full_messages.join(" ")
      @dialog = true
      redirect_to '/'
    end
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def destroy
    @user = User.friendly.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :current_city, :email, :password, :photo, :username)
  end
end
