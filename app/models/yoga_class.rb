class YogaClass < ApplicationRecord
    belongs_to :teacher
    belongs_to :style
    has_many :user_classes
    has_many :users, through: :user_classes
    
    validates :date, :time, uniqueness:true, presence:true
    validates :teacher, presence:true
    validates :style, presence:true
end
