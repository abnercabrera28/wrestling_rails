class Team < ApplicationRecord
    has_many :wrestlers
    has_many :users, through: :wrestlers

    accepts_nested_attributes_for :wrestlers

    validates :name, presence: true, uniqueness: true
end
