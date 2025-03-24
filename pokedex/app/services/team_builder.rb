class TeamBuilder
  def self.create_new_member(team, data)
    team.team_members.build(
      name: data["name"],
      pokemon_id: data["id"]
    )
  end
  def self.check_team_size(team)
    team.team_members.count >= 6
  end
end
