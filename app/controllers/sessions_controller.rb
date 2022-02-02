class SessionsController < ApplicationController
    def new 
    end 

    def create
        #working on refactor
        if auth 
            @user =
            User.find_or_create_by(email: auth['info']['email']) do |u|
              u.password = SecureRandom.hex(12)
              u.first_name = "Github User"
              u.last_name = auth['info']['email']
            end
            if @user
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                flash[:message] = "Incorrect email or password"
                redirect_to signin_path
           end 

        else 
            user = User.find_by(email: params[:user][:email])
             if user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else 
                flash[:message] = "Incorrect email or password"
                redirect_to signin_path
            end 
        end 
    end 

    def destroy
        session.clear
        redirect_to '/'
    end 

    private

    def auth
        request.env['omniauth.auth']
    end
end
