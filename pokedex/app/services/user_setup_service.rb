class UserSetupService
  def initialize(user)
    @user = user
  end

  def call
    create_default_teams
  end

  private

  def create_default_teams
    (1..10).each do |num|
      @user.teams.create!(team_number: num)
    end
  end
end
