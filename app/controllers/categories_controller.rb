class CategoriesController < ApplicationController
    before_action :require_admin, except: [:show, :index]
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category was successfully created"
            redirect_to categories_path
        else
            render "new"
        end
    end

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page: params[:page], per_page: 3)
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:notice] = "Category was successfully updated"
            redirect_to @category
        else
            render "edit"
        end
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "You do not have admin access"
            redirect_to categories_path
        end
    end
end