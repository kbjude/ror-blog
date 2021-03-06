class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "jude", password: "jude", except: [:index, :show]

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
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def delete
    @article = Article.find(params[:id])
    if @article.delete(article_params)
      @article.destroy
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
