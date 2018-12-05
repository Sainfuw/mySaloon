require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
 include Devise::Test::IntegrationHelpers
  setup do      
    @user = users(:one)
  end
  
  test "should get index" do
    sign_in @user
    get dashboard_index_url
    assert_response :success
  end

end
