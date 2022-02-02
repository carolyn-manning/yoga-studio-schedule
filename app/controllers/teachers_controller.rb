class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all
    end 

    def show
        @teacher = Teacher.find_by_id(params[:id])
        @yoga_classes = @teacher.yoga_classes
    end 

    def new
        redirect_if_not_admin
        @teacher = Teacher.new
    end 

    def create  
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
            redirect_to teachers_path
        else 
            render 'new'
        end 
    end 

    def edit
        redirect_if_not_admin
        @teacher = Teacher.find_by(id: params[:id])
    end
    
    def update
        teacher = Teacher.find_by(id: params[:id])
        teacher.update(teacher_params)
        redirect_to teacher_path(teacher)
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
