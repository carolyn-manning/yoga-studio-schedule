class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all
    end 

    def show
        @teacher = Teacher.find_by_id(params[:id])
    end 

    def new
        @teacher = Teacher.new
    end 

    def create  
        @teacher = Teacher.new(teacher_params)
        if @teacher.save!
            redirect_to teachers_path
        else 
            render 'new'
        end 
    end 

    private

    def teacher_params
        params.require(:teacher).permit(
            :first_name,
            :last_name,
            :bio, 
            )
    end 


end
