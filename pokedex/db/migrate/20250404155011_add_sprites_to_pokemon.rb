class AddSpritesToPokemon < ActiveRecord::Migration[8.0]
  def change
    add_column :pokemons, :sprites, :jsonb
  end
end
