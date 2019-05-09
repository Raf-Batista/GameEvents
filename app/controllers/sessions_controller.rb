class SessionsController < ApplicationController
    def new 
    end

    def create 
        user = User.find_by(:username => params[:username])
        login(user)
        redirect_to user_path(user)
    end 
end
