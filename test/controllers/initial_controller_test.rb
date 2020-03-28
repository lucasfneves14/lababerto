require 'test_helper'

class InitialControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get initial_show_url
    assert_response :success
  end

end
