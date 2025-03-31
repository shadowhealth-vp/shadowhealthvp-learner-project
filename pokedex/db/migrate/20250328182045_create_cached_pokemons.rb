class CreateCachedPokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :cached_pokemons do |t|
      t.string :name
      t.jsonb :data

      t.timestamps
    end
  end
end
