class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
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
end
