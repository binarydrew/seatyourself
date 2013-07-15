class ReservationsController < ApplicationController


  before_filter :ensure_logged_in, only: [:new, :create, :edit, :update, :destroy]
  # def show
  #   @reservation = Reservation.find(params[:id])
  # end

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.restaurant_id = @restaurant.id

    if @reservation.save
      redirect_to user_path(current_user)    
      flash[:notice] = "Reservation created"
    else
      flash[:alert] = "Reservation could not be created at this time. Sorry."
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(@reservation.restaurant_id)

  end

  def update
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(@reservation.restaurant_id)

    if @reservation.update_attributes(reservation_params)
      redirect_to user_path(current_user)
      flash[:notice] = "YEAAAHHH!! Reservation was successfully updated. Woo..fucking..hoo"
    else
      flash[:alert] = "Reservation couldn't be updated"
      render :edit
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(current_user)
    flash[:alert] = "Reservation deleted"
  end



  private

  def reservation_params
    params.require(:reservation).permit(:datetime, :duration, :guests, :datetime)
  end



end
