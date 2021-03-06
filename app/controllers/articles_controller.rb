class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.page(params[:page]).per(10).order(created_at: 'DESC')
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to root_path, notice: '記事を投稿しました。'
    else
      render :new
    end
  end
  
  def show
    @comment = current_user.comments.build if user_signed_in?
    @comments = @article.comments.order(created_at: 'DESC')
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path, notice: '記事を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: '記事を削除しました。'
  end  

  private
  
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def check_correct_user
    unless user_signed_in? && current_user.id == @article.user_id
      redirect_to root_path
    end
  end
end
