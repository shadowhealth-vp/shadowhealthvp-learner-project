class PokemonCacheService
  EXPIRATION_TIME = 1.minutes

  def self.find_or_fetch(name)
    pokemon = Pokemon.find_by(name: name)

    if pokemon && pokemon.fetched_time > EXPIRATION_TIME.ago
      puts "Using cached version"
      return pokemon # use cached version
    end

    puts "Doing a fresh fetch 1 minute from PokeAPI..."
    # Fetch fresh from API
    details = PokemonApiService.get_by_name(name)

    mapped_data = map_api_to_model(details)
    mapped_data[:fetched_time] = Time.current # Gets the current time data is fetched
    # Insert into the DB cache layer
    if pokemon
      pokemon.update!(mapped_data)
    else
      pokemon = Pokemon.create!(mapped_data)
    end

    puts "Created/Updated Pokemon #{pokemon.inspect}"

    pokemon
  end

  # Converts API JSON to Pokemon model.
  def self.map_api_to_model(details)
    {
      name: details["name"],
      poke_id: details["id"],
      types: details["types"].map { |t| t["type"]["name"] },
      height: details["height"],
      weight: details["weight"],
      sprite_url: details["sprites"]["front_default"],
      stats: details["stats"].map { |s| { s["stat"]["name"] => s["base_stat"] } }.reduce({}, :merge),
      abilities: details["abilities"].map { |a| a["ability"]["name"] }
    }
  end
end
