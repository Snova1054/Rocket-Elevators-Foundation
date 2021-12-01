class Battery < ApplicationRecord
    belongs_to :building
    has_many :interventions
    has_many :columns
end
