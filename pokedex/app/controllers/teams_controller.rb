require "net/http"
require "json"

class TeamsController < ApplicationController
  URL = "https://pokeapi.co/api/v2/pokemon"

  def teams_page
    response = Net::HTTP.get(URI("#{URL}?limit=151"))
    data = JSON.parse(response)
    all_pokemons = data["results"]

    @team = current_user.teams.first_or_create(name: "My Team")
    @team_members = @team.team_members

    if params[:query].present?
      query = params[:query].downcase.strip
      @pokemons_search = all_pokemons.select { |pokemon| pokemon["name"].start_with?(query) }
    else
      @pokemons_search = all_pokemons
    end

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "pokemon_results",
          partial: "teams/pokemon_grid",
          locals: { pokemons: @pokemons_search }
        )
      end # <-- closes format.turbo_stream do
    end   # <-- closes respond_to
  end

  def create_team_member
    @team = current_user.teams.find(params[:team_id])
    name = params[:pokemon_name].downcase.strip

    if @team.team_members.count >= 6
      redirect_to teams_teams_page_path, alert: "Team already has 6 Pokémon."
      return
    end

    begin
      response = Net::HTTP.get(URI("https://pokeapi.co/api/v2/pokemon/#{name}"))
      data = JSON.parse(response)

      new_member = @team.team_members.build(
        name: data["name"],
        pokemon_id: data["id"]
      )

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
