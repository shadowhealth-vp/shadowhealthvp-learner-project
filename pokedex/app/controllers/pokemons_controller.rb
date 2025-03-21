require "net/http"
require "json"

class PokemonsController < ApplicationController
  URL = "https://pokeapi.co/api/v2/pokemon"

  def index
    response = Net::HTTP.get(URI("#{URL}?limit=500"))
    data = JSON.parse(response)

    # array of Pokémon with name/url
    @pokemons = data["results"]
  end

  def show
    pokemon_name = params[:id]

    # testing out cache in
    @pokemon = Rails.cache.fetch("pokemon_#{pokemon_name}", expires_in: 1.hour) do
      response = Net::HTTP.get(URI("#{URL}/#{pokemon_name}"))
      JSON.parse(response)
    end

    render :show
  end
end
