require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do      
    @user = users(:one)
    @service = services(:one)
  end

  test "should get index" do
    sign_in @user
    get services_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_service_url
    assert_response :success
  end

  test "should create service" do
    sign_in @user
    assert_difference('Service.count') do
      post services_url, params: { service: { author_id: @service.author_id, name: @service.name, price: @service.price, status: @service.status } }
    end

    assert_redirected_to services_url
  end

  test "should show service" do
    sign_in @user
    get service_url(@service)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_service_url(@service)
    assert_response :success
  end

  test "should update service" do
    sign_in @user
    patch service_url(@service), params: { service: { author_id: @service.author_id, name: @service.name, price: @service.price, status: @service.status } }
    assert_redirected_to services_url
  end

  test "should destroy service" do
    sign_in @user
    assert_difference('Service.count', -1) do
      delete service_url(@service)
    end

    assert_redirected_to services_url
  end
end
