puts "Seeding Pokemon into DB.."

# Fetch all 251 (Kanto-Johto) Pokemon
pokemon_list = PokemonApiService.get_all(351)

# Loop through each pokemon
pokemon_list.each_with_index do |poke, i|
  details = PokemonApiService.get_by_id(poke["name"])

  # Add into our DB ( use create!() to create or update() to update)
  Pokemon.create!(
    name: details["name"],
    poke_id: details["id"],
    types: details["types"].map { |t| t["type"]["name"] },
    height: details["height"],
    weight: details["weight"],
    sprite_url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{details["id"]}.png",
    stats: details["stats"].map { |s| { s["stat"]["name"] => s["base_stat"] } }.reduce({}, :merge),
    abilities: details["abilities"].map { |a| a["ability"]["name"] },
    fetched_time: Time.current
  )

  puts "Finished Seeding #{details["name"].capitalize} (#{i + 1}/351)}"
end

puts "Done Seeding All Pokemon"
