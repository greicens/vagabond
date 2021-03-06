class PostsController < ApplicationController
  include UsersHelper
  before_action :require_login, only: [:new]
  def index
    @city_posts = Post.all
  end

  def new
    @post = Post.new
    @user = current_user || User.new
  end

  def create
    @city = City.friendly.find(params[:city_id])
    @user = current_user
    @post = Post.create(post_params)
    if @post.save
      @city.posts << @post
      @user.posts << @post
      post_points #increase users points
      redirect_to city_path(@city)
    else
      flash[:new_post_error] = @post.errors.full_messages.join(" ")

      redirect_to city_path(@city)
    end

  end

  def show
    post_id = params[:id]
    @user = User.friendly.find(params[:user_id])
    @post = @user.posts.find_by_id(post_id)

  end



  def edit
    @user = User.friendly.find(params[:user_id])
    @post = Post.find_by_id(params[:id])
  end

  def update
    @user = User.friendly.find(params[:user_id])
    post = Post.find_by_id(params[:id])
    post.update(post_params)
    redirect_to user_path(@user)
  end

  def destroy
    user = User.friendly.find(params[:user_id])
    post = Post.find_by_id(params[:id])
    post.destroy
    redirect_to user_path(user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :message)
  end
end
