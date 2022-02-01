class User < ApplicationRecord
    has_secure_password
    has_many :user_classes
    has_many :yoga_classes, through: :user_classes

    validates :email, uniqueness: true, presence:true
    validates :first_name, presence: true
    validates :last_name, presence: true
end
