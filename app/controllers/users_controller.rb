class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    user = User.find_by_id(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :current_city)
  end
end
