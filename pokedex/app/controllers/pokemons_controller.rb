require "net/http"
require "json"

class PokemonsController < ApplicationController
  def index
    all_pokemons = Pokemon.order(:poke_id)
    @types = Pokemon.distinct.pluck(:types).flatten.uniq.sort
    @pokemons = PokemonService.search_and_filter_pokemon(params[:query], params[:type], all_pokemons)
  end
  def show
    @pokemons = Pokemon.all.order(:poke_id) # Entire list of pokemons
    @pokemon = PokemonCacheService.find_or_fetch(params[:name])
  end
end
