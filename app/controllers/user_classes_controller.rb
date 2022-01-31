class UserClassesController < ApplicationController
    def add_class
        yoga_class = YogaClass.find_by_id(params[:yoga_class_id])
        UserClass.create(user: current_user, yoga_class: yoga_class) 
        redirect_to user_path(current_user)
    end 

    def destroy
        @yoga_class = YogaClass.find_by_id(params[:yoga_class_id])
        UserClass.find_by(yoga_class:@yoga_class).destroy
        redirect_to user_path(current_user)
    end 


end
