require 'test_helper'

class PeliculaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pelicula_index_url
    assert_response :success
  end

end
