class Api::V1::CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: { comments: CommentSerializer.new(@comment) }, status: :created
    else
      render json: { error: 'failed to create project' }, status: :not_acceptable
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:project_id, :content)
  end
end