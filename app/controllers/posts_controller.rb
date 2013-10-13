 class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
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
