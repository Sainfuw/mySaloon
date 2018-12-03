require "application_system_test_case"

class BillingsTest < ApplicationSystemTestCase
  setup do
    @billing = billings(:one)
  end

  test "visiting the index" do
    visit billings_url
    assert_selector "h1", text: "Billings"
  end

  test "creating a Billing" do
    visit billings_url
    click_on "New Billing"

    fill_in "Amount", with: @billing.amount
    fill_in "Code", with: @billing.code
    fill_in "Currency", with: @billing.currency
    fill_in "Customer", with: @billing.customer_id
    fill_in "Payment Method", with: @billing.payment_method
    click_on "Create Billing"

    assert_text "Billing was successfully created"
    click_on "Back"
  end

  test "updating a Billing" do
    visit billings_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @billing.amount
    fill_in "Code", with: @billing.code
    fill_in "Currency", with: @billing.currency
    fill_in "Customer", with: @billing.customer_id
    fill_in "Payment Method", with: @billing.payment_method
    click_on "Update Billing"

    assert_text "Billing was successfully updated"
    click_on "Back"
  end

  test "destroying a Billing" do
    visit billings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Billing was successfully destroyed"
  end
end
