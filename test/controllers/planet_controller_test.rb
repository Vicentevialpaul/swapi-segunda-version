require 'test_helper'

class PlanetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planet_index_url
    assert_response :success
  end

end
