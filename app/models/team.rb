class Team < ApplicationRecord
    has_many :wrestlers
    has_many :users, through: :wrestlers
end
