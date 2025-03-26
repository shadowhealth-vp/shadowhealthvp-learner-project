class CreatePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :poke_id
      t.string :types, array: true, default: []
      t.integer :height
      t.integer :weight
      t.string :sprite_url
      t.jsonb :stats
      t.string :abilities, array: true, default: []

      t.timestamps
    end
  end
end
