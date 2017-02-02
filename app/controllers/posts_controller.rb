class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    p "#{params} this is the params"
    if @post.save
      redirect_to @post
    else
      p @post.errors.full_messages
      flash[:error] = "Unable to add new post try again"
      redirect_to posts_new_path
    end

  end

  def show
    @post = Post.find_by_id(params[:id])
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

  private

  def post_params
    params.require(:post).permit(:title, :message)
  end
end
