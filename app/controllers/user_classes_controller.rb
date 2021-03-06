class UserClassesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def add_class
        yoga_class = YogaClass.find_by_id(params[:yoga_class_id])
        UserClass.create(user: current_user, yoga_class: yoga_class) 
        redirect_to user_path(current_user)
        flash[:message] = "Class Added to your Schedule"
    end 

    def destroy
        @yoga_class = YogaClass.find_by_id(params[:yoga_class_id])
        UserClass.find_by(yoga_class:@yoga_class).destroy
        redirect_to user_path(current_user)
        flash[:message] = "Class Removed from your Schedule"
    end 


end
