class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @pet = @booking.pet
    @review = Review.new(review_params)
    @review.pet = @pet
    authorize @review
    if @review.save
      redirect_to pet_path(@pet)
    else
      render 'pets/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end

end
