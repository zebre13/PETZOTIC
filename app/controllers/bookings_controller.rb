class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @marker = [
      {
        lat: @booking.pet.latitude,
        lng: @booking.pet.longitude,
        # info_window: render_to_string(partial: "info_window", locals: { pet: @booking.pet })
      }]
  end

  def new
    @user = current_user
    @pet = Pet.find(params[:id])
    @booking = Booking.new
    authorize @pet
    authorize @user
    authorize @booking
  end

  def create
    @user = current_user
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = @user
    # authorize @user
    # authorize @pet
    authorize @booking
    if @pet.user == @user
      flash.alert = "You can't book your own pet, silly"
      redirect_to pets_path
    elsif @booking.save
      redirect_to dashboard_path
    else
      flash.alert = "Overlapping reservation exists for this pet at those dates. Please try another dates"
      redirect_to pet_path(@pet)
    end
  end

  def destroy
    @booking = Booking.find(params[:id]) # Correction BB : @booking = Restaurant.find(params[:id]) précédemment
    @booking.destroy
    authorize @booking
    redirect_to user_path(@user)
  end


  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      notice[:message, "Update didn't work"]
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:confirmed, :starting_date, :ending_date, :status)
  end
end
