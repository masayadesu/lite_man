require 'test_helper'

class LiteraturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get literatures_index_url
    assert_response :success
  end

end
