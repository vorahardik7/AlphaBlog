require "byebug"

class SessionsController < ApplicationController

    def new
        
    end

    def create
        # byebug
        userEmail = params[:session][:email].downcase
        userPassword = params[:session][:password]
        user = User.find_by(email: userEmail)
        if user && user.authenticate(userPassword)
            flash[:notice] = "Logged in successfully! Welcome #{user.username}"
            session[:user_id] = user.id
            redirect_to user
        else
            flash.now[:alert] = "Credentials don't match. Try again!"
            render "new", status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end
