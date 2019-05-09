class SessionsController < ApplicationController
    def new 
        redirect_to user_path(current_user) if logged_in?
    end

    def create 
        user = User.find_by(:username => params[:username])
        login(user)
        redirect_to user_path(user)
    end 
end
