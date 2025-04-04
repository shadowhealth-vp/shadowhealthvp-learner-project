class AddTeamNumberToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :team_number, :integer
  end
end
