require "net/http"
require "json"

class PokemonsController < ApplicationController
  def index
    data = PokemonService.get_all(151)
    @pokemons = PokemonService.get_pokemon_data(data)
  end

  def show
    pokemon_id = params[:id]
    @pokemon = PokemonService.get_by_id(pokemon_id)

    render :show
  end
end
