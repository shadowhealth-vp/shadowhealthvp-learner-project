class AddTypesToTeamMembers < ActiveRecord::Migration[8.0]
  def change
    add_column :team_members, :types, :text
  end
end
