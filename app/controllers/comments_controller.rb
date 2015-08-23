class CommentsController < ApplicationController
  before_filter :authenticate!, only: [:create, :destory]
  def create
    comment = Comment.new
    comment.commentable = commentable
    comment.commentable_user_id = commentable.user_id
    comment.user = current_user
    comment.comment = params[:comment]
    comment.save!
    if request.xhr?
      render json: { comment: comment } , status:201
    else
      render json: { comment: comment } , status:201
    end
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    comment.destroy
    head :no_content
  end

  private

  def commentable
    params[:commentable].classify.constantize.find(params[:commentable_id])
  end

end
