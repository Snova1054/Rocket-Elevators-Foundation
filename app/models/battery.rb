class Battery < ApplicationRecord
    belongs_to :building
    has_many :intervention
    has_many :columns
end
