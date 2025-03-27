require "net/http"
require "json"

class TeamsController < ApplicationController
  def teams_page
  @team = current_user.teams.first_or_create(name: "My Team")
  @team_members = @team.team_members

  all_pokemons = Pokemon.order(:poke_id)
  @pokemons = all_pokemons

  @pokemons_search = PokemonService.search_pokemon(params[:query], @pokemons)
  end

  def add_team_member
    @team = current_user.teams.find(params[:team_id])
    name = params[:pokemon_name].downcase.strip

    if TeamBuilder.check_team_size(@team)
      redirect_to teams_teams_page_path, alert: "Team already has 6 Pokémon."
      return
    end

    begin
      response = Net::HTTP.get(URI("https://pokeapi.co/api/v2/pokemon/#{name}"))
      data = JSON.parse(response)

      new_member = TeamBuilder.create_new_member(@team, data)

      if new_member.save
        puts "Testing"
        redirect_to teams_teams_page_path, alert: "#{data["name"].capitalize} added to your team!"
      else
        redirect_to teams_teams_page_path, alert: "Failed to save Pokémon."
      end
    rescue => e
      redirect_to teams_teams_page_path, alert: "Pokémon not found"
    end
  end

  def destroy
    team = current_user.teams.find(params[:id])
    team.team_members.destroy_all
    redirect_to teams_teams_page_path, alert: "Team deleted"
  end
end
