require 'byebug'

class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        puts "creating article"
        
        @article = Article.new(params.require(:article).permit(:title, :description))
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
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article updated successfully"
            redirect_to '/articles'
        else
            render 'edit'
        end

    end
end
