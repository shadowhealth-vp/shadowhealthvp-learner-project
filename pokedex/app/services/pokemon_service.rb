require "net/http"

class PokemonService
  URL = "https://pokeapi.co/api/v2/pokemon"

  def self.get_all(limit: 500)
    Rails.cache.fetch("pokemon_all_#{limit}", expires_in: 1.hour) do
      response = Net::HTTP.get(URI("#{URL}?limit=#{limit}"))
      data = JSON.parse(response)

      # Array of Pokémon with name/url
      data["results"]
    end
  end

  def self.get_by_id(pokemon_id)
    # testing out cache in
    Rails.cache.fetch("pokemon_#{pokemon_id}", expires_in: 1.hour) do
      response = Net::HTTP.get(URI("#{URL}/#{pokemon_id}"))
      JSON.parse(response)
    end
  end

  def self.search_pokemon(query, all_pokemons)
    return all_pokemons if query.blank?
    all_pokemons.select { |pokemon| pokemon["name"].start_with?(query) }
  end
end
