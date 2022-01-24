class YogaClassesController < ApplicationController
    def new 
        @yoga_class = YogaClass.new
    end 
end
