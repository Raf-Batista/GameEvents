class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create 
        user = User.new(user_params)
        user.save
        redirect_to users_path(user)
    end 

    private 

    def user_params 
        params.require(:user).permit(:email, :username, :password)
    end 
end
