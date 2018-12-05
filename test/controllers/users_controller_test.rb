require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get users_url
    assert_response :success
  end

  test "should get new" do
  sign_in @user
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    sign_in @user
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'test@user.com', password: '123123', name: 'name', lastname: 'lastname', role: 'professional', status: 'enabled' } }
    end

    assert_redirected_to users_url
  end

  test "should show user" do
    sign_in @user
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    sign_in @user
    patch user_url(@user), params: { user: { email: @user.email, lastname: @user.lastname, name: @user.name, phone: @user.phone, role: @user.role, status: @user.status, surname: @user.surname } }
    assert_redirected_to users_url
  end

  test "should destroy user" do
    sign_in @user
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
