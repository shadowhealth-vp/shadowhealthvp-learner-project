class PokemonService
  def self.get_pokemon_data(data)
    @pokemons = data.map do |pokemon|
      details = PokemonApiService.get_by_id(pokemon["name"])
      {
        name: details["name"],
        id: details["id"],
        types: details["types"].map { |t| t["type"]["name"] }
      }
    end
  end

  def self.get_next_pokemon(cur_poke_id)
    Pokemon.find_by(poke_id: cur_poke_id + 1)
  end

  def self.search_pokemon(query, all_pokemons)
    return all_pokemons if query.blank?
    all_pokemons.select { |pokemon| pokemon[:name].start_with?(query.downcase.strip) }
  end
end
