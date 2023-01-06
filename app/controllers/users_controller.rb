class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
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

    def destroy
        @user.destroy
        flash[:alert] = "Account and all associated articles successfully deleted"
        if !current_user.admin?
            session[:user_id] = nil
        end
        redirect_to articles_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "You can only edit your profile"
            redirect_to @user
        end
    end

end