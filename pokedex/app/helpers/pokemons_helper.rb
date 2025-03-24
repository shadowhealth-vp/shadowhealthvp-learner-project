module PokemonsHelper
  def get_sprite_url_from_id(pokemon_id)
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_id}.png"
  end
end
