class CommentsController < ApplicationController
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
end
