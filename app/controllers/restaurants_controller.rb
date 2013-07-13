class RestaurantsController < ApplicationController

  def index
    @title = "Restaurants"
    @restaurants = Restaurant.all
    
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.opening_time = @restaurant.parsed_time(params[:restaurant]["opening_time(4i)"], params[:restaurant]["opening_time(5i)"])
    @restaurant.closing_time = @restaurant.parsed_time(params[:restaurant]["closing_time(4i)"], params[:restaurant]["closing_time(5i)"])
      
    @restaurant.save
    redirect_to restaurants_path
    
  end

  def new
    @title = "Add a Restaurant"
    @restaurant = Restaurant.new
    # @cuisine = Cuisine.all
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    redirect_to @restaurant
  end

  def edit
    @title = "Edit a Restaurant"
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price_range, :cuisine_id, :capacity)
  end

  def find(time)
    time.split
  end

end
