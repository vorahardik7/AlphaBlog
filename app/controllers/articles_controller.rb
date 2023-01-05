require 'byebug'

class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        # @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 3)

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
        @article.user = current_user
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
        # puts "Update article"
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

    def require_same_user
        if current_user != @article.user
            flash[:alert] = "You can only edit/delete your articles"
            redirect_to @article
        end
    end
end
