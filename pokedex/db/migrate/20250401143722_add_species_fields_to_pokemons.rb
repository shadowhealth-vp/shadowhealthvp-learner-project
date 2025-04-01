class AddSpeciesFieldsToPokemons < ActiveRecord::Migration[8.0]
  def change
    add_column :pokemons, :species, :string
    add_column :pokemons, :habitat, :string
    add_column :pokemons, :is_legendary, :boolean
    add_column :pokemons, :is_mythical, :boolean
    add_column :pokemons, :capture_rate, :integer
    add_column :pokemons, :base_happiness, :integer
    add_column :pokemons, :shape, :string
    add_column :pokemons, :growth_rate, :string
    add_column :pokemons, :color, :string
    add_column :pokemons, :gender_ratio, :string
    add_column :pokemons, :generation, :string
  end
end
