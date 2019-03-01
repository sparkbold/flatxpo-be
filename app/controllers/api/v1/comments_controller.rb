class Api::V1::CommentsController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    @comment = Comment.create(comment_params)
    if current_user 
      @comment.user = current_user 
    else
      @comment.user = User.find(1)
    end

    if @comment.save
      render json: { comments: CommentSerializer.new(@comment) }, status: :created
    else
      render json: { error: 'failed to create comment' }, status: :not_acceptable
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:project_id, :content)
  end
end
