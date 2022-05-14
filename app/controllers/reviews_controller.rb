class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @pet = Pet.find(params[:id])

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:reviews).permit(:content, :rating)
  end
end
