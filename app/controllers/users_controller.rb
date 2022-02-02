class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def index
        redirect_if_not_admin
        if params[:yoga_class_id]
            @users = YogaClass.find(params[:yoga_class_id]).users
        else
            redirect_to '/'
        end
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render 'new'
        end 
    end 

    def show 
        @user = User.find_by_id(params[:id])
        @yoga_classes = @user.yoga_classes
        redirect_if_not_current_user
    end 


    private 
    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email, 
            :password
            )
    end 

end
