class AddTeamIdToWrestlers < ActiveRecord::Migration[6.1]
  def change
    add_column :wrestlers, :team_id, :integer
  end
end
