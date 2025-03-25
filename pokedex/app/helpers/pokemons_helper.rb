module PokemonsHelper
  def get_sprite_url_from_id(pokemon_id)
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_id}.png"
  end

  def get_sprite_url_from_name(pokemon_name)
    "nil"
  end
end
