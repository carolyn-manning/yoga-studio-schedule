class Teacher < ApplicationRecord
    has_many :yoga_classes
    has_many :yoga_classes
    has_many :styles, through: :yoga_classes

    validates :first_name, :last_name, uniqueness:true, presence:true

    def full_name 
        first_name + " " + last_name
    end 
end
