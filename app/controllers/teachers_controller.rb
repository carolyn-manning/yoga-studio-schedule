class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all
    end 

    def show
        @teacher = Teacher.find_by_id(params[:id])
    end 
end
