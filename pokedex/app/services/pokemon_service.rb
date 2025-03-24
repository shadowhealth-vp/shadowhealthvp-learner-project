require "net/http"

class PokemonService
  URL = "https://pokeapi.co/api/v2/pokemon"

  def get_all(limit: 500)
    response = Net::HTTP.get(URI("#{URL}?limit=#{limit}"))
    data = JSON.parse(response)

    # array of Pokémon with name/url
    data["results"]
  end

  def get_by_id(pokemon_id)
    # testing out cache in
    Rails.cache.fetch("pokemon_#{pokemon_id}", expires_in: 1.hour) do
      response = Net::HTTP.get(URI("#{URL}/#{pokemon_id}"))
      JSON.parse(response)
    end
  end
end