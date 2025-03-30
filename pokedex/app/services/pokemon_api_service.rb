require "net/http"
# Any PokeAPI service goes here

class PokemonApiService
  URL = "https://pokeapi.co/api/v2/pokemon"

  def self.get_all(limit = 351)
    Rails.cache.fetch("pokemon_all_#{limit}", expires_in: 1.hour) do
      response = Net::HTTP.get(URI("#{URL}?limit=#{limit}"))
      data = JSON.parse(response)

      # Array of Pokémon with name/url
      data["results"]
    end
  end

  def self.get_by_name(name)
    name = name.downcase.strip

    # Checks if the pokemon is previously stored inside the CachedPokemon model
    cached = CachedPokemon.find_by(name: name)

    # If the record exists, we use it
    if cached && cached.updated_at > 12.hours.ago
      return cached.data
    end

    response = Net::HTTP.get(URI("#{URL}/#{name}"))
    data = JSON.parse(response)
    puts "Showcasing data"
    # Fetch fresh data from external API if no cached data
    record = CachedPokemon.find_or_initialize_by(name: name)
    record.data = data
    record.save!

    data
  end

  def self.get_by_id(pokemon_id)
    Rails.cache.fetch("pokemon_#{pokemon_id}", expires_in: 1.hour) do
      response = Net::HTTP.get(URI("#{URL}/#{pokemon_id}"))
      JSON.parse(response)
    end
  end
end
