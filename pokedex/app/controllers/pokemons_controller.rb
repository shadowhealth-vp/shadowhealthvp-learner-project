require "net/http"
require "json"

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:poke_id)
  end

  def show
    @pokemon = PokemonCacheService.find_or_fetch(params[:name])
    # render :show
  end
end
