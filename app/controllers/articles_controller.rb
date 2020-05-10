class ArticlesController < ApplicationController

    def new
    end

    def create
        @articles = Article.new(article_params)

        @article.save
        redirect_to @article
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    private
    def article_params
       params.require(:article).permit(:title, :text)
    end
end
