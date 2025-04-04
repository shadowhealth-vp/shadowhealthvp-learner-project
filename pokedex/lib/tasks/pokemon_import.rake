# TO - DO
# Research and create a rake to fetch data from PokeAPI

namespace :pokemon do
  desc "Import and get all 1300 pokemon into the database"
  task import_all: :environment do
    puts "Fetching all Pokemon as rake task. . ."

    results = PokemonApiService.get_all_base_pokemon_data(1026)

    results.each_with_index do |pokemon, index|
            name = pokemon["name"]
            begin
                puts "Processing ##{index + 1}: #{name}"
                PokemonCacheService.find_or_fetch(name)
            rescue => e
                puts "Failed to fetch #{name}: #{e.message}"
            end
        end

        puts "Import complete! ! ! ! ! !"
    end
end
