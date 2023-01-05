class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, except: [:new, :index, :show]
    before_action :require_same_user, only: [:edit, :update]
    
    def new
        @user = User.new
    end

    def index
        # @users = User.all
        @users = User.paginate(page: params[:page], per_page: 3)
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 3)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Blog, #{@user.username}!. You have successfully registered"
            redirect_to articles_path
        else
            render "new"
        end
    end

    def edit
    end

    def update
        # puts "Update article"
        if @user.update(user_params)
            flash[:notice] = "User updated successfully"
            redirect_to @user
        else
            render 'edit'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
            flash[:alert] = "You can only edit your profile"
            redirect_to @user
        end
    end

end