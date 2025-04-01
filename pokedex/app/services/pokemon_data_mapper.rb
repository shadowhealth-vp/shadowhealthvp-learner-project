# Maps ALL the data from API Map Service
class PokemonDataMapper
  def self.full_map(name)
    base_data = PokemonApiService.get_base_pokemon_data(name)
    species_data = PokemonApiService.get_species_data(name)

    ApiMapService.map_api_to_model(base_data)
                 .merge(ApiMapService.map_species_to_model(species_data))
                 .merge({ fetched_time: Time.current })
  end
end
