require "test_helper"

class DressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dresses_index_url
    assert_response :success
  end
end
