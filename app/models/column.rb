class Column < ApplicationRecord
    belongs_to :battery
    has_many :intervention
    has_many :elevators
end
