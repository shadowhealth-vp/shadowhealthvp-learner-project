
class TeamsController < ApplicationController
  def teams_page
    # Select the correct team based on params
    selected_team = current_user.teams.find_by(team_number: params[:team_id]) ||
                    current_user.teams.order(:team_number).first

    # If no team exists yet, redirect to fix setup
    unless selected_team
      redirect_to teams_teams_page_path, alert: "No team found for this user."
      return
    end

    @team = selected_team
    @team_members = @team.team_members

    @types = Pokemon.distinct.pluck(:types).flatten.uniq.sort
    @pokemons = Pokemon.order(:poke_id)
    @pokemons_search = PokemonService.search_and_filter_pokemon(params[:query], params[:type], @pokemons)
  end



  def add_team_member
    @team = current_user.teams.find(params[:team_id])
    name = params[:pokemon_name].downcase.strip

    if TeamBuilder.check_team_size(@team)
        redirect_to teams_teams_page_path(team_id: @team.team_number), alert: "Team already has 6 Pokémon."
        return
    end

    pokemon = Pokemon.find_by(name: name)

    if pokemon.nil?
        redirect_to teams_teams_page_path(team_id: @team.team_number), alert: "Pokémon not found in local cache."
        return
    end

    new_member = TeamBuilder.create_new_member(@team, pokemon)

    if new_member.save
        redirect_to teams_teams_page_path(team_id: @team.team_number), alert: "#{pokemon.name.capitalize} added to your team!"
    else
        redirect_to teams_teams_page_path(team_id: @team.team_number), alert: "Failed to save Pokémon."
    end
  end



  def destroy
    team = current_user.teams.find(params[:id])
    team.team_members.destroy_all
    redirect_to teams_teams_page_path(team_id: @team.team_number), alert: "Team deleted"
  end
end
