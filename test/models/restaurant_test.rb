require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  
  setup do
    @restaurant = FactoryGirl.create(:restaurant)
  end

  test 'Restaurant has many reviews' do
    assert @restaurant.respond_to?(:reviews)
  end

  test 'Restaurant has many users through reservations' do
    assert @restaurant.respond_to?(:users)
  end

  test 'Restaurant has many reservations' do
    assert @restaurant.respond_to?(:reservations)
  end

  test 'Restaurant belongs to cuisine' do
    assert @restaurant.respond_to?(:cuisine)
  end

end
