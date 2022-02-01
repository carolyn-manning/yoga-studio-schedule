class YogaClass < ApplicationRecord
    belongs_to :teacher
    belongs_to :style
    has_many :user_classes
    has_many :users, through: :user_classes
    
    validates :date, :time, uniqueness:true, presence:true
    validates :teacher, presence:true
    validates :style, presence:true

    def style_name=(name)
        self.style = Style.find_or_create_by(name: name)
      end
   
      def style_name
         self.style ? self.style.name : nil
      end
end
