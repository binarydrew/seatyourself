require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  setup do
    @review = FactoryGirl.create(:review)
  end

  test 'Review belongs to one user' do
    assert @review.respond_to?(:user)
  end

  test 'Review belongs to restaurant' do
    assert @review.respond_to?(:restaurant)
  end

end
