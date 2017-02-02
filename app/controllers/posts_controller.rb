class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(post_params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.crete(post_params)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    post = Post.find_by_id(params[:id])
    post.update(post_params)
    redirect_to post_path
  end

  def destroy
    user = User.find_by_id(current_user)
    post = Post.find_by_id(params[:id])
    post.destroy
    redirect_to user_path
  end
end
