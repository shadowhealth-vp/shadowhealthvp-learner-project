class TeamMembersController < ApplicationController
  def destroy
    team = current_user.teams.find(params[:team_id])
    member = team.team_members.find(params[:id])
    member.destroy
    redirect_to teams_teams_page_path, alert: "#{member.name.capitalize} removed from team"
  end
end
