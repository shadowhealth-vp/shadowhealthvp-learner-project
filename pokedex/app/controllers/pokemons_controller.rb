require "net/http"
require "json"

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:poke_id)
  end

  def show
    @pokemons = Pokemon.all.order(:poke_id) # Entire list of pokemons
    @pokemon = PokemonCacheService.find_or_fetch(params[:name])
  end
end
