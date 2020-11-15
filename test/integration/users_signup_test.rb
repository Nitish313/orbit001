require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: "  ", email: "tony@example", password: "pass", password_confirmation: "word"} }
    end
    assert_template 'users/new'
  end
  
  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {name: "Nitish", email: "nitish@example.com", password: "password123", password_confirmation: "password123"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
