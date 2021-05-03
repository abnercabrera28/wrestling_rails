class Wrestler < ApplicationRecord
    belongs_to :user 
    belongs_to :team
    
    #accepts_nested_attributes_for :team

    validates :name, presence: true
    validates :hails_from, presence: true
    validates :birthdate, presence: true

    def team_attributes=(attributes)
        if !attributes[:name].blank?
            self.team = Team.find_or_create_by(attributes)
        end
    end
end
