class PokemonService
  def self.get_next_pokemon(cur_poke_id)
    Pokemon.find_by(poke_id: cur_poke_id + 1)
  end

  def self.search_and_filter_pokemon(query, type, all_pokemons)
    return all_pokemons if query.blank? && type.blank?

    all_pokemons.select do |pokemon|
      name_match = query.blank? || pokemon[:name].start_with?(query.downcase.strip)
      type_match = type.blank? || pokemon[:types].include?(type.downcase.strip)
      name_match && type_match
      end
  end
end
