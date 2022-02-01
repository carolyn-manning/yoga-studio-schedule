class Teacher < ApplicationRecord
    has_many :yoga_classes
    has_many :yoga_classes
    has_many :styles, through: :yoga_classes

    validates :last_name, uniqueness: {scope: :first_name}
    validates :last_name, presence:true
    validates :first_name, presence:true

    def full_name 
        first_name + " " + last_name
    end 
end
