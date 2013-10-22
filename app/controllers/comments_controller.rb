class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_comment, only: [:show, :edit, :update, :vote]

def create
    @post = Post.find_by(slug: params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: "Your comment was added"
    else
      render 'posts/show'
    end
  end

def vote
    Vote.create(voteable: @comment,  creator: current_user, vote: params[:vote] )
    redirect_to :back, notice: "Your vote was counted once"
end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

private

  def set_comment
    @comment = Comment.find(params[:id])
  end