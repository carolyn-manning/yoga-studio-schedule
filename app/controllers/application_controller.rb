class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private 
    def current_user 
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
        !!current_user
    end 

    def redirect_if_not_current_user
        if @user && @user != current_user && logged_in?
            redirect_to user_path(current_user)
            #flash 
        elsif !@user || !logged_in?
            redirect_to '/'
        end 
    end
end
