require 'test_helper'

class BookingServiceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get booking_service_index_url
    assert_response :success
  end

  test "should get new" do
    get booking_service_new_url
    assert_response :success
  end

end
