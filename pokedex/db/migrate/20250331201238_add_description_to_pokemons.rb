class AddDescriptionToPokemons < ActiveRecord::Migration[8.0]
  def change
    add_column :pokemons, :description, :text
  end
end
