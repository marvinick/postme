class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    if post.save
      flash[:notice] = "Your post was saved."
      redirect_to posts_path

    else

    end
  end

  def edit

  end

  def update

  end

  private

  def post_params
   # if user.admin?
      # params.require(:post).permit!
  params.require(:post).permit(:title, :url, :description)
  end

end
