class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index


  def index
    pets_authorised = policy_scope(Pet)

    if params[:query].present?
      Pet.algolia_reindex!
      pets_query = Pet.algolia_search(params[:query])
      @pets = pets_query & pets_authorised
    else
      @pets = pets_authorised
    end


    @markers = @pets.map do |pet|
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
    @review = Review.new
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

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    redirect_to user_path
  end

  private

  def pet_params
    params.require(:pet).permit(:category, :name, :description, :specie, :price, photos: [])
  end
end
