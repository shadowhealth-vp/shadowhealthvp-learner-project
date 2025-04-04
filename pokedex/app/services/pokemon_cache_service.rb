class PokemonCacheService
  EXPIRATION_TIME = 1.minutes

  def self.find_or_fetch(name)
    # Main function used by controller to get PokeAPI data
    cur_pokemon = Pokemon.find_by(name: name)

    # Check if fetched exists or needs to be updated
    if cur_pokemon && cur_pokemon.fetched_time > EXPIRATION_TIME.ago
        puts "TIMESTAMP NOT EXPIRED! USING CACHED VERSION. . . ."
        return cur_pokemon # Use cached version
    end

    puts "Doing a fresh fetch #{EXPIRATION_TIME} from PokeAPI..."

    mapped_data = PokemonDataMapper.full_map(name)
    # Insert into the DB cache layer
    if cur_pokemon
    cur_pokemon.update!(mapped_data)
    else
    cur_pokemon = Pokemon.create!(mapped_data)
    end

    puts "Finished creating/updating Pokemon #{name.capitalize}!"

    cur_pokemon
  end
end
