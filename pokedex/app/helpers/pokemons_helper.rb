module PokemonsHelper
  def get_sprite_url_from_id(pokemon_id)
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon_id}.png"
  end

  def type_badge_class(type)
    case type
    when "fire"
      "bg-red-700 text-white"
    when "water"
      "bg-sky-700 text-white"
    when "grass"
      "bg-green-700 text-white"
    when "electric"
      "bg-yellow-600 text-black"
    when "psychic"
      "bg-pink-600 text-white"
    when "ice"
      "bg-cyan-600 text-white"
    when "fighting"
      "bg-orange-700 text-white"
    when "poison"
      "bg-purple-700 text-white"
    when "ground"
      "bg-amber-800 text-white"
    when "flying"
      "bg-indigo-600 text-white"
    when "bug"
      "bg-lime-700 text-white"
    when "rock"
      "bg-yellow-800 text-white"
    when "ghost"
      "bg-violet-800 text-white"
    when "dragon"
      "bg-indigo-900 text-white"
    when "dark"
      "bg-gray-900 text-white"
    when "steel"
      "bg-gray-600 text-white"
    when "fairy"
      "bg-pink-500 text-white"
    else
      "bg-gray-400 text-black"
    end
  end


def type_color_class(type)
  case type
  when "fire"
    "bg-red-200"
  when "water"
    "bg-blue-200"
  when "grass"
    "bg-green-200"
  when "electric"
    "bg-yellow-100"
  when "psychic"
    "bg-pink-200"
  when "ice"
    "bg-cyan-100"
  when "fighting"
    "bg-orange-300"
  when "poison"
    "bg-purple-200"
  when "ground"
    "bg-amber-300"
  when "flying"
    "bg-indigo-200"
  when "bug"
    "bg-lime-300"
  when "rock"
    "bg-yellow-400"
  when "ghost"
    "bg-violet-300"
  when "dragon"
    "bg-indigo-400"
  when "dark"
    "bg-gray-600"
  when "steel"
    "bg-gray-300"
  when "fairy"
    "bg-pink-200"
  else
    "bg-sky-200"
  end
end
end
