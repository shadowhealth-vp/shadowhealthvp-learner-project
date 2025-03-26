# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding Pokemon into DB.."

# Fetch the pokemon
pokemon_list = PokemonService.get_all(251)

# Loop through each pokemon
pokemon_list.each_with_index do |poke, i|
  details = PokemonService.get_by_id(poke["name"])

  # Add into our DB ( use create!() to create or update() to update)
  Pokemon.create!(
    name: details["name"],
    poke_id: details["id"],
    types: details["types"].map { |t| t["type"]["name"] },
    height: details["height"],
    weight: details["weight"],
    sprite_url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{details["id"]}.png",
    stats: details["stats"].map { |s| { s["stat"]["name"] => s["base_stat"] } }.reduce({}, :merge),
    abilities: details["abilities"].map { |a| a["ability"]["name"] }
  )

  puts "Finished Seeding #{details["name"].capitalize} (#{i + 1}/251)}"
end

puts "Done Seeding All Pokemon"
