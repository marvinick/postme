class CommentsController < ApplicationController
def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: "Your comment was added"
    else
      render 'posts/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end