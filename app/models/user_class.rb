class UserClass < ApplicationRecord
    belongs_to :user
    belongs_to :yoga_class

    validate :is_not_duplicate?

    def is_not_duplicate?
        if user.yoga_classes.any?
            dates = user.yoga_classes.collect {|yc| date} 
            if dates.include? date
                errors.add(:base, "You already have a class on this date")
            end 
        end
    end

    def date
        yoga_class.date
    end
end
