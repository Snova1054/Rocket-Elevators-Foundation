class Column < ApplicationRecord
    belongs_to :battery
    has_many :interventions
    has_many :elevators
end
