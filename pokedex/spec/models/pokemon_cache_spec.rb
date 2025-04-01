# Currently broken

describe PokemonCacheService do
  it "fetches fresh data when cache is expired" do
    # seed expired data
    Pokemon.create!(name: "bulbasaur", poke_id: 1, fetched_at: 2.days.ago)

    pokemon = PokemonCacheService.find_or_fetch("bulbasaur")
    expect(pokemon.fetched_at).to be > 12.hours.ago
  end
end
