require 'test_helper'

class StarshipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get starship_index_url
    assert_response :success
  end

end
