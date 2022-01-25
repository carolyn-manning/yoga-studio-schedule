class Teacher < ApplicationRecord
    has_many :yoga_classes
    has_many :yoga_classes
    has_many :styles, through: :yoga_classes
end
