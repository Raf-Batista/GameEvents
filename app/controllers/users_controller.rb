class UsersController < ApplicationController
    def new 
        redirect_to user_path(current_user) if logged_in?
        @user = User.new
    end 

    def create 
        user = User.new(user_params)
        user.save
        redirect_to user_path(user)
        login(user)
    end 

    def show 
        @user = User.find(params[:id])
    end 

    private 

    def user_params 
        params.require(:user).permit(:email, :username, :password)
    end 
end
