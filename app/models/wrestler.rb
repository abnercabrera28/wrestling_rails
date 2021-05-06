class Wrestler < ApplicationRecord
    belongs_to :user 
    belongs_to :team
    
    validates :name, presence: true
    validates :hails_from, presence: true
    validates :birthdate, presence: true

    scope :most_recent, -> { order created_at: :desc }
    
    def team_attributes=(attributes)
        if !(attributes[:name].blank? || attributes[:description].blank?)
            self.team = Team.find_or_create_by(attributes)
        end
    end
end
