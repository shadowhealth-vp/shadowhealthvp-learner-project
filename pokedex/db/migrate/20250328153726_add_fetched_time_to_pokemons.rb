class AddFetchedTimeToPokemons < ActiveRecord::Migration[8.0]
  def change
    add_column :pokemons, :fetched_time, :datetime
  end
end
