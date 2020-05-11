class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @articles = Article.new(article_params)

    if @articles.save
      redirect_to @articles
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
