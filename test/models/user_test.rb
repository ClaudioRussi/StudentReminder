require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save User without name" do
    user = User.new email: "useremail@example.com", password: 'password', password_confirmation: 'password'
    assert_not user.save, "User was saved without name"
  end

  test "should not save User without email" do
    user = User.new password: 'password', password_confirmation: 'password', name: "Usuario"
    assert_not user.save, "User was saved without email"
  end

  test "should not save User without password" do
    user = User.new email: "useremail@example.com", password_confirmation: 'password', name: "Usuario"
    assert_not user.save, "User was saved without password"
  end

  test "should save User with correct parameters" do
    user = User.new email: 'useremail@example.com', password: 'password', password_confirmation: 'password', name: "Usuario"
    assert user.save, "User was not saved"
  end
end
