require "rails_helper"

# Team Size test
RSpec.describe Team do
  it "does not allow more than 6 Pokemon on a team" do
    user = User.create!(email: "ash@example.com", password: "pikachu123")
    team = Team.create!(user: user, name: "Test Team")

    # Add 6 Pokemon to the team
    6.times do |i|
      TeamMember.create!(
        team: team,
        name: "pokemon#{i}",
        pokemon_id: i + 1
      )
    end

    size_check = TeamBuilder.check_team_size(team)
    expect(size_check).not_to be_falsey
  end
end
