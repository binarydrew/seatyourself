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
    @restaurant.opening_time = @restaurant.parse_time(params[:restaurant]["opening_time(4i)"], params[:restaurant]["opening_time(5i)"])
    @restaurant.closing_time = @restaurant.parse_time(params[:restaurant]["closing_time(4i)"], params[:restaurant]["closing_time(5i)"])
    
    if @restaurant.save
      redirect_to restaurants_path    
      flash[:notice] = "Restaurant was successfully created"
    else
      flash[:notice] = "Restaurant could not be created."
      render :new
    end
  end

  def new
    @title = "Add a Restaurant"
    @restaurant = Restaurant.new
    @cuisine = Cuisine.all
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.opening_time = @restaurant.parse_time(params[:restaurant]["opening_time(4i)"], params[:restaurant]["opening_time(5i)"])
    @restaurant.closing_time = @restaurant.parse_time(params[:restaurant]["closing_time(4i)"], params[:restaurant]["closing_time(5i)"])
    @restaurant.update_attributes(restaurant_params)
    redirect_to @restaurant
  end

  def edit
    @title = "Edit a Restaurant"
    @restaurant = Restaurant.find(params[:id])
    @restaurant.opening_time = @restaurant.unparse_time(@restaurant.opening_time)
    @restaurant.closing_time = @restaurant.unparse_time(@restaurant.closing_time)

  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price_range, :cuisine_id, :capacity)
  end

end
