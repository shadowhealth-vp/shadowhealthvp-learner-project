require "test_helper"

class TeamMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get team_members_destroy_url
    assert_response :success
  end
end
