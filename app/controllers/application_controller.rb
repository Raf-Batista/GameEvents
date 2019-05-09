class ApplicationController < ActionController::Base
    def login(user) 
        session[:user_id] = user.id
    end 

    def logout 
        session.clear
    end 

    def logged_in? 
        !!session[:user_id]
    end 

    def current_user 
        User.find(session[:user_id]) if session[:user_id]
    end 
end
