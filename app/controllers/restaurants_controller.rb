class RestaurantsController < ApplicationController

  before_filter :ensure_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def index
    @title = "Restaurants"
    @restaurants = Restaurant.all

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    binding.pr
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.opening_time = @restaurant.parse_time(params[:restaurant]["opening_time(4i)"], params[:restaurant]["opening_time(5i)"])
    @restaurant.closing_time = @restaurant.parse_time(params[:restaurant]["closing_time(4i)"], params[:restaurant]["closing_time(5i)"])
    
    if @restaurant.save
      redirect_to restaurants_path    
      flash[:notice] = "BOOM! Restaurant created, yo."
    else
      flash[:alert] = "Idiot. I can't create a restaurant with invalid fields. Duh."
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
    
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant
      flash[:notice] = "YEAAAHHH!! Restaurant was successfully updated. Woo..fucking..hoo"
    else
      flash[:alert] = "Dude, WTF?! This shitty (probably Chinese) restaurant failed to update."
      render :edit
    end
  end

  def edit
    @title = "Edit a Restaurant"
    @restaurant = Restaurant.find(params[:id])
    @restaurant.opening_time = @restaurant.unparse_time(@restaurant.opening_time)
    @restaurant.closing_time = @restaurant.unparse_time(@restaurant.closing_time)

  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    
    if @restaurant.destroy
      redirect_to restaurants_path
      flash[:notice] = "You killed that muthafucking Restaurant!"
    else
      flash[:alert] = "You can't delete a non-existent restaurant, sucka!"
      redirect_to restaurants_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price_range, :cuisine_id, :capacity)
  end

end
