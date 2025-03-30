require "net/http"
require "json"

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:poke_id)
  end

  def show
    # Using only static data in DB
    # @pokemon = Pokemon.find_by(name: params[:name])

    # Using caching logic
    #
    puts "CLASS OF @pokemon: #{@pokemon.class.name}"

    @pokemon = PokemonCacheService.find_or_fetch(params[:name])

    # Redirection testing
    # if @pokemon.nil?
    #   redirect_to pokemons_path, alert: "Pokémon not found"
    #   nil
    # end

    # render :show
  end
end
