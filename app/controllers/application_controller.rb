class ApplicationController < ActionController::Base
    include ApplicationHelper

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform this action"
            redirect_to login_path
        end
    end
end
