class Team < ApplicationRecord
    has_many :wrestlers
    has_many :users, through: :wrestlers

    validates :name, presence: true, uniqueness: true
end
