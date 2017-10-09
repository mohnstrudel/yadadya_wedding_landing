require 'test_helper'

class Front::StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get front_static_pages_home_url
    assert_response :success
  end

end
