 class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  # 1. set up something
  # 2. redirect away from action

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash[:notice] = "Your post was saved."
      redirect_to posts_path

    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "This post was updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "A post has just been deleted"
    redirect_to posts_path
end

  private

  def post_params
   # if user.admin?
      # params.require(:post).permit!
  params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
