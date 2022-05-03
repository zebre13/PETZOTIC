class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
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
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:category, :name, :description, :specie, :price, :photos)
  end
end
