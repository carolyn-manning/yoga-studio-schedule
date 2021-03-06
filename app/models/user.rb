class User < ApplicationRecord
    has_secure_password
    has_many :user_classes
    has_many :yoga_classes, through: :user_classes

    validates :email, uniqueness: true, presence:true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name 
        first_name + " " + last_name
    end 

    def upcoming_user_classes
        self.yoga_classes.where('date >= ?', Date.today)
    end
end
