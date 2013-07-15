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
    save_date_time
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
  end

  def update
    @reservation = Reservation.find(params[:id])

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
  end



  private

  def reservation_params
    params.require(:reservation).permit(:datetime, :duration, :guests, :date, :time)
  end

  def save_date_time
    time = params[:time]
    date = params[:date]
    params[:datetime] = date + time
  end



end
