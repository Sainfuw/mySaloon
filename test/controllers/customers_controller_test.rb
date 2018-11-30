require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do      
    @user = users(:one)
    @customer = customers(:one)
  end

  test "should get index" do
    sign_in @user
    get customers_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    sign_in @user
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { author_id: @customer.author_id, email: @customer.email, name: @customer.name, phone: @customer.phone, status: @customer.status } }
    end

    assert_redirected_to customers_url
  end

  test "should show customer" do
    sign_in @user
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    sign_in @user
    patch customer_url(@customer), params: { customer: { author_id: @customer.author_id, email: @customer.email, name: @customer.name, phone: @customer.phone, status: @customer.status } }
    assert_redirected_to customers_url
  end

  test "should destroy customer" do
    sign_in @user
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
