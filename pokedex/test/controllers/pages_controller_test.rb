require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get teams_page" do
    get pages_teams_page_url
    assert_response :success
  end
end
