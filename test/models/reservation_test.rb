require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  
  setup do
    @reservation = FactoryGirl.create(:reservation)
  end

  test 'Reservation belongs to restaurant' do
    assert @reservation.respond_to?(:restaurant)
  end

  test 'Reservation belongs to user' do
    assert @reservation.respond_to?(:user)
  end
end
