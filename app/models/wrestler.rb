class Wrestler < ApplicationRecord
    belongs_to :user 
    belongs_to :team
    
    accepts_nested_attributes_for :team

    validates :name, presence: true
    validates :hails_from, presence: true
    validates :birthdate, presence: true
end
