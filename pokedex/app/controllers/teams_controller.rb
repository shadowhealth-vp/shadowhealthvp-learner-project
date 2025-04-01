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

    pokemon = Pokemon.find_by(name: name)

    if pokemon.nil?
        redirect_to teams_teams_page_path, alert: "Pokémon not found in local cache."
        return
    end

    new_member = TeamBuilder.create_new_member(@team, pokemon)

    if new_member.save
        redirect_to teams_teams_page_path, alert: "#{pokemon.name.capitalize} added to your team!"
    else
        redirect_to teams_teams_page_path, alert: "Failed to save Pokémon."
    end
  end



  def destroy
    team = current_user.teams.find(params[:id])
    team.team_members.destroy_all
    redirect_to teams_teams_page_path, alert: "Team deleted"
  end
end
