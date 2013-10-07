class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Your post was saved."
      redirect_to posts_path

    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "This post was updated!"
      redirect_to post_path
    else
      render :edit
    end
  end

  private

  def post_params
   # if user.admin?
      # params.require(:post).permit!
  params.require(:post).permit(:title, :url, :description)
  end

end
