require 'test_helper'

class CuisineTest < ActiveSupport::TestCase
  
  setup do
    @cuisine = FactoryGirl.create(:cuisine)
  end

  test 'Cuisine has many restaurants' do
    assert @cuisine.respond_to?(:restaurants)
  end

end
