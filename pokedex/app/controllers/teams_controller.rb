require "net/http"
require "json"

class TeamsController < ApplicationController
  def teams_page
    all_pokemons = PokemonService.get_all(limit: 151)

    @team = current_user.teams.first_or_create(name: "My Team")
    @team_members = @team.team_members

    # Pokemon Search Logic into service
    @pokemons_search = PokemonService.search_pokemon(params[:query], all_pokemons)

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "pokemon_results",
          partial: "teams/pokemon_grid",
          locals: { pokemons: @pokemons_search }
        )
      end
    end
  end

  def create_team_member
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
    redirect_to teams_teams_page_path, notice: "Team deleted"
  end
end
