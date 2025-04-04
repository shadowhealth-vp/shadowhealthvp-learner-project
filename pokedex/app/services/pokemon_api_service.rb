require "net/http"
# Any PokeAPI service goes here

class PokemonApiService
  URL_POKEMON = "https://pokeapi.co/api/v2/pokemon"
  URL_POKEMON_SPECIES = "https://pokeapi.co/api/v2/pokemon-species/"

  def self.get_all_base_pokemon_data(limit = 1302)
    response = Net::HTTP.get(URI("#{URL_POKEMON}?limit=#{limit}"))
    data = JSON.parse(response)
    data["results"]
  end

  def self.get_base_pokemon_data(name)
    name = name.downcase.strip

    puts "MAKING API CALL .. . . . . .. . . . . .. . . "
    response = Net::HTTP.get(URI("#{URL_POKEMON}/#{name}"))
    data = JSON.parse(response)
    data
  end

  def self.get_by_id(pokemon_id)
    response = Net::HTTP.get(URI("#{URL}/#{pokemon_id}"))
    JSON.parse(response)
  end

  # Pokemon Species API call
  def self.get_species_data(name)
    response = Net::HTTP.get(URI("#{URL_POKEMON_SPECIES}/#{name}"))
    JSON.parse(response)
  end
end
