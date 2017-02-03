class PostsController < ApplicationController
  before_action :require_login, only: [:new]
  def index
    @city_posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @city = City.friendly.find(params[:city_id])
    @user = current_user
    @post = Post.create(post_params)
    if @post.save
      @city.posts << @post
      @user.posts << @post
      redirect_to user_post_path(@user, @post)
    else
      p @post.errors.full_messages
      flash[:error] = "Unable to add new post try again"
      redirect_to posts_new_path(current_user)
    end

  end

  def show
    post_id = params[:id]
    @user = current_user
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
