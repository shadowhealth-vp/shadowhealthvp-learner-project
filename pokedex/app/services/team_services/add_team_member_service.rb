class AddTeamMember
  def self.create_new_member(team, pokemon)
    team.team_members.create(
        name: pokemon.name,
        pokemon_id: pokemon.poke_id,
        types: pokemon.types
      # Nickname? Movesets? Level?
    )
  end

  def self.check_team_size(team)
    team.team_members.count >= 6
  end
end
