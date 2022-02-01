class YogaClassesController < ApplicationController
    def new 
        #redirect_if_not_admin
        @yoga_class = YogaClass.new
    end 

    def create 
        @yoga_class = YogaClass.new(yoga_class_params)
        if @yoga_class.save!
            redirect_to yoga_classes_path
        else 
            render 'new'
        end 
    end 

    def index
        if params[:user_id]
            @yoga_classes = User.find(params[:user_id]).yoga_classes
            #create scope 
        else 
            @yoga_classes = YogaClass.upcoming_classes
        end 
    end 

    def show 
        @yoga_class = YogaClass.find_by(id:params[:id])
    end 

    def edit
        @yoga_class = YogaClass.find_by(id: params[:id])
    end
    
    def update
        yoga_class = YogaClass.find_by(id: params[:id])
        yoga_class.update(yoga_class_params)
        redirect_to yoga_classes_path
    end

    private 

    def yoga_class_params
        params.require(:yoga_class).permit(
            :date,
            :time,
            :style_name, 
            :teacher_id,
            :studio_id
            )
    end 
end
