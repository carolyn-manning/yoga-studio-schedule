class YogaClass < ApplicationRecord
    belongs_to :studio
    belongs_to :teacher
    belongs_to :style
end
