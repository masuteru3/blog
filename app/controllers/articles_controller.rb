class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
