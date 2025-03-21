class CreateTeamMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :team_members do |t|
      t.string :name
      t.integer :pokemon_id
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
