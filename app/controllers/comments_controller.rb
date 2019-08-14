class CommentsController < ApplicationController
  before_action :check_correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(params[:article_id]), notice: 'コメントを投稿しました。'
    else
      redirect_to article_path(params[:article_id]), alert: 'コメントを投稿出来ませんでした。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(params[:article_id]), notice: 'コメントを削除しました。'
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(article_id: params[:article_id])
  end

  def check_correct_user
    comment = Comment.find(params[:id])
    unless user_signed_in? && current_user.id == comment.user_id
      redirect_to root_path
    end
  end
end
