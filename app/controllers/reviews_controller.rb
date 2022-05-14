class ReviewsController < ApplicationController

  def create
    @pet = Pet.find(params[:id])
    @review = Review.new(review_params)
    @review.pet = @pet
    if @review.save
      redirect_to pet_path(@pet)
    else
      render 'pets/show'
    end
  end

  private

  def review_params
    params.require(:reviews).permit(:content, :rating)
  end

end
