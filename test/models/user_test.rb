require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    # @reservation = FactoryGirl.create(:reservation)
    # @restaurant = FactoryGirl.create(:restaurant)
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
end
