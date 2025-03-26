require "net/http"
require "json"

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:poke_id)
  end

  def show
    @pokemon = Pokemon.find_by(name: params[:name])

    if @pokemon.nil?
      redirect_to pokemons_path, alert: "Pokémon not found"
    end
    # render :show
  end
end
