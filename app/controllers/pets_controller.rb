class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(%i[category name description specie])
  end
end
