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

    def create
        puts "creating article"
        
        # @article = Article.new(title: params[:title], description: params[:description])
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article saved successfully"
            redirect_to '/articles'
        else
            render 'new'
        end
        # render plain: params[:article]
        # BELOW CODE NOT WORKING
        # @article = Article.new(params.require(@article).permit(:title, :description))

        # TO GET ONLY ONE ARTICLE (IT WILL AUTOMATICALLY GET ID)
        # redirect_to @article 
        
    end
end
