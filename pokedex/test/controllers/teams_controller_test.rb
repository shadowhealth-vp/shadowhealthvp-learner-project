require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get teams_page" do
    get teams_teams_page_url
    assert_response :success
  end
end
