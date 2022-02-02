class YogaClassesController < ApplicationController
    def new 
        redirect_if_not_admin
        @yoga_class = YogaClass.new
        @teacher = Teacher.find_by_id(params[:teacher_id])
    end 

    def create 
        @yoga_class = YogaClass.new(yoga_class_params)
        if @yoga_class.save
            redirect_to schedule_path
        else 
            render 'new'
        end 
    end 

    def index
        @yoga_classes = YogaClass.upcoming_classes
    end 

    def show 
        @yoga_class = YogaClass.find_by(id:params[:id])
    end 

    def edit
        redirect_if_not_admin
        @yoga_class = YogaClass.find_by(id: params[:id])
    end
    
    def update
        yoga_class = YogaClass.find_by(id: params[:id])
        yoga_class.update(yoga_class_params)
        redirect_to schedule_path
    end

    def destroy
        yoga_class = YogaClass.find_by_id(params[:id])
        yoga_class.delete
        redirect_to schedule_path
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
