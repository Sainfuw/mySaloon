require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do      
    @user = users(:one)
    @booking = bookings(:one)
  end

  test "should get index" do
    sign_in @user
    get bookings_url
    assert_response :success
  end
end
