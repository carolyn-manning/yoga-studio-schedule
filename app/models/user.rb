class User < ApplicationRecord
    has_secure_password
    has_many :user_classes
    has_many :yoga_classes, through: :user_classes
end
