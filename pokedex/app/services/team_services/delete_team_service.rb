class DeleteTeamService
  def initialize(user, team_id)
    @user = user
    @team_id = team_id
  end

  def call
    team = @user.teams.find(@team_id)
  team.team_members.destroy_all
  end
end
