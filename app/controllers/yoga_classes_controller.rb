class YogaClassesController < ApplicationController
    def new 
        @yoga_class = YogaClass.new
    end 

    def create 
        @yoga_class = YogaClass.new(yoga_class_params)
        if @yoga_class.save
            redirect_to yoga_classes_path
        else 
            render 'new'
        end 
    end 

    private 

    def yoga_class_params
        params.require(:yoga_class).permit(
            :date,
            :time,
            :style, 
            :teacher,
            :studio
            )
    end 
end
