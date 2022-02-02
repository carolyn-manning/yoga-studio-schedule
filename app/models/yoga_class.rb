class YogaClass < ApplicationRecord
    belongs_to :teacher
    belongs_to :style
    has_many :user_classes
    has_many :users, through: :user_classes
    
    validates :time, uniqueness: {scope: :date}
    validates :teacher, presence:true
    validates :style, presence:true
    validates :date, presence:true
    validates :time, presence:true 
    validate :date_is_in_future

    def date_is_in_future
        errors.add(:date, "cannot be in the past") if date && date <= Date.today     
    end
 
    def style_name=(name)
        self.style = Style.find_or_create_by(name: name)
    end
   
    def style_name
        self.style ? self.style.name : nil
    end

    def formatted_date 
        date.strftime("%m/%d/%Y")
    end 

    def formatted_time
        time.strftime("%H:%M")
    end

    def self.upcoming_classes
        where('date >= ?', Date.today)
    end 

    def self.past_classes
        date < Date.today 
    end 
end
