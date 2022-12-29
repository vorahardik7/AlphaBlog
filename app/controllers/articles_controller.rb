require 'byebug'

class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    
    def show
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        puts "creating article"
        
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article saved successfully"
            redirect_to '/articles'
        else
            render 'new'
        end
        # render plain: params[:article]

        # TO GET ONLY ONE ARTICLE (IT WILL AUTOMATICALLY GET ID)
        # redirect_to @article 
        
    end

    def update
        puts "Update article"
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully"
            redirect_to '/articles'
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article deleted successfully"
        redirect_to '/articles'     
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end
