class PokemonCacheService
  EXPIRATION_TIME = 10.minutes

  def self.find_or_fetch(name)
    # Main function used by controller to get PokeAPI data
    pokemon = Pokemon.find_by(name: name)

    # Check if fetched_time exists
    if pokemon && pokemon.fetched_time > EXPIRATION_TIME.ago
      puts "Using cached version"
      return pokemon # use cached version
    end

    puts "Doing a fresh fetch 1 minute from PokeAPI..."

    mapped_data = PokemonDataMapper.full_map(name)
    # Insert into the DB cache layer
    if pokemon
      pokemon.update!(mapped_data)
    else
      pokemon = Pokemon.create!(mapped_data)
    end

    puts "Created/Updated Pokemon #{pokemon.inspect}"

    pokemon
  end
end
