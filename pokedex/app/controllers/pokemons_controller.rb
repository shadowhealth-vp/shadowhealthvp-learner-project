require "net/http"
require "json"

class PokemonsController < ApplicationController
  def index
    @pokemons = PokemonService.get_all
  end

  def show
    pokemon_id = params[:id]

    @pokemon = PokemonService.get_by_id(pokemon_id)

    render :show
  end
end
