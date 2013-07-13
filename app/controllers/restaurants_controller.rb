class RestaurantsController < ApplicationController

  def index
    @title = "Restaurants"
    @restaurants = Restaurant.all
    
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.opening_time = parsed_time(params[:restaurant]["opening_time(4i)"], params[:restaurant]["opening_time(5i)"])
    @restaurant.closing_time = parsed_time(params[:restaurant]["closing_time(4i)"], params[:restaurant]["closing_time(5i)"])
      
      
    
      
    @restaurant.save
    redirect_to restaurants_path
    
  end

  def new
    @title = "Add a Restaurant"
    @restaurant = Restaurant.new
    @cuisine = Cuisine.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price_range, :cuisine_id, :capacity)
  end

  def parsed_time(hour, minute)
    hour + ":" + minute
  end

end
