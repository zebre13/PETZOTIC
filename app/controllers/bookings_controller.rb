class BookingsController < ApplicationController
  def new
    @user = current_user
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @pet = Pet.find(params[:id])
    @booking = Booking.new(params[booking_params])
    @booking.pet = @pet
    @booking.user = @user
    if @booking.save
      redirect_to user_path(@user)
    else
      render :pet
    end
  end

  def destroy
    @booking = Restaurant.find(params[:id])
    @booking.destroy
    redirect_to user_path(@user)
  end

  def booking_params
    params.require(:booking).permit(:confirmed, :start_date, :end_date)
  end
end
