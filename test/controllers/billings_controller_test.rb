require 'test_helper'

class BillingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do      
    @user = users(:one)
    @service = services(:one)
    @billing = billings(:one)
  end

  test "should get index" do
    sign_in @user
    get billings_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_billing_url
    assert_response :success
  end

  test "should create billing" do
    sign_in @user
    assert_difference('Billing.count') do
      post billings_url, params: { billing: { amount: @billing.amount, code: @billing.code, currency: @billing.currency, customer_id: @billing.customer_id, payment_method: @billing.payment_method } }
    end

    assert_redirected_to billing_url(Billing.last)
  end

  test "should show billing" do
    sign_in @user
    get billing_url(@billing)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_billing_url(@billing)
    assert_response :success
  end

  test "should update billing" do
    sign_in @user
    patch billing_url(@billing), params: { billing: { amount: @billing.amount, code: @billing.code, currency: @billing.currency, customer_id: @billing.customer_id, payment_method: @billing.payment_method } }
    assert_redirected_to billing_url(@billing)
  end

  test "should destroy billing" do
    sign_in @user
    assert_difference('Billing.count', -1) do
      delete billing_url(@billing)
    end

    assert_redirected_to billings_url
  end
end
