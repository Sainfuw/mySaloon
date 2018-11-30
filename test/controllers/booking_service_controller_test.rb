require 'test_helper'

class BookingServiceControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do      
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get booking_service_index_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_booking_service_url
    assert_response :success
  end

end
