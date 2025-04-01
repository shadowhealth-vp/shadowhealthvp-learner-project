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
      "bg-red-600 text-white"
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
      "bg-amber-800 text-white"
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
      "bg-pink-400 text-black"
    else
      "bg-gray-200 text-black-800"
    end
  end

def type_color_class(type)
  case type
  when "fire"
    "bg-red-400"
  when "water"
    "bg-sky-300"
  when "grass"
    "bg-green-300"
  when "electric"
    "bg-yellow-200"
  when "psychic"
    "bg-pink-300"
  when "ice"
    "bg-cyan-200"
  when "fighting"
    "bg-orange-400"
  when "poison"
    "bg-purple-300"
  when "ground"
    "bg-yellow-600"
  when "flying"
    "bg-indigo-200"
  when "bug"
    "bg-lime-400"
  when "rock"
    "bg-yellow-500"
  when "ghost"
    "bg-violet-500"
  when "dragon"
    "bg-indigo-600"
  when "dark"
    "bg-gray-700"
  when "steel"
    "bg-gray-200"
  when "fairy"
    "bg-pink-300"
  else
    "bg-sky-200"
  end
end
end
