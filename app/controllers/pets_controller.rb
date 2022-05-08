class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @pets = policy_scope(Pet)
    p @pets.count

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet })
      }
    end
    @markers.count
  end

  def show
    @user = current_user
    @pet = Pet.find(params[:id])
    @booking = Booking.new
    authorize @pet
  end

  def new
    @pet = Pet.new
    @pet.user = current_user
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render 'new'
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    @pet.user = current_user
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render 'new'
    end
  end

  # def destroy
  #   @pet = Pet.find(params[:id])
  #   @pet.destroy
  #   authorize @pet
  #   redirect_to pets_path
  # end

  private

  def pet_params
    params.require(:pet).permit(:category, :name, :description, :specie, :price, photos: [])
  end
end
