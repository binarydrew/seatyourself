require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = FactoryGirl.build(:user)
    # @reservation = FactoryGirl.create(:reservation)
    # @restaurant = FactoryGirl.create(:restaurant)
  end

  teardown do
    @user.destroy
  end

  test "User has many reservations" do
    # assert_equal @user.reservations.last.restaurant, @restaurant
    assert @user.respond_to?(:reservations)
  end

  test "User has many reviews" do
    assert @user.respond_to?(:reviews)
  end

  test 'User has many restaurants through reservations' do
    assert @user.respond_to?(:restaurants)
  end

  test "User should respond_to all its attributes" do
    assert @user.respond_to?(:first_name)
    assert @user.respond_to?(:last_name)
    assert @user.respond_to?(:email)
    assert @user.respond_to?(:password)
    assert @user.respond_to?(:password_confirmation)
  end

  test "User needs a first_name" do
    @user.first_name = ""
    refute @user.valid?
  end

  test "User needs a last_name" do
    @user.last_name = ""
    refute @user.valid?
  end

  test "User needs a email" do
    @user.email = ""
    refute @user.valid?
  end

  test "User needs a password" do
    user = FactoryGirl.build(:user, password: nil)
    refute user.valid?
  end

  test "User needs a password_confirmation" do
    @user.password_confirmation = ""
    refute @user.valid?
  end

  test "password and password_confirmation should be the same" do
    @user.password_confirmation = "mismatch"
    refute @user.valid?
  end

  test "when email address is already taken" do
    @user.save
    user2 = FactoryGirl.build(:user)
    user2.email = @user.email
    refute user2.valid?
  end

  test "When user name is too long" do
    @user.password = "a" * 51
    refute @user.valid?
  end

  test "When password is too short" do
    @user.password = "a"
    @user.password_confirmation = "a"
    refute @user.valid?
  end

end
