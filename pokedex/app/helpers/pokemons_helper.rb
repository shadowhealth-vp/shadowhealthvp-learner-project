module PokemonsHelper
  def get_sprite_url_from_id(pokemon_id)
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_id}.png"
  end

  def get_sprite_url_from_name(pokemon_name)
    "nil"
  end

  def type_badge_class(type)
    case type
    when "fire"
      "bg-red-500 text-white"
    when "water"
      "bg-sky-500 text-white"
    when "grass"
      "bg-green-500 text-white"
    when "electric"
      "bg-yellow-400 text-black"
    when "psychic"
      "bg-pink-500 text-white"
    when "ice"
      "bg-cyan-300 text-black"
    when "fighting"
      "bg-orange-600 text-white"
    when "poison"
      "bg-purple-500 text-white"
    when "ground"
      "bg-yellow-800 text-white"
    when "flying"
      "bg-indigo-300 text-black"
    when "bug"
      "bg-lime-500 text-black"
    when "rock"
      "bg-yellow-700 text-white"
    when "ghost"
      "bg-violet-700 text-white"
    when "dragon"
      "bg-indigo-800 text-white"
    when "dark"
      "bg-gray-800 text-white"
    when "steel"
      "bg-gray-400 text-black"
    when "fairy"
      "bg-pink-300 text-black"
    else
      "bg-gray-200 text-gray-800"
    end
  end
end
