class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @confirmed_bookings = @user.bookings.select{|booking| booking.accepted?}
    @pending_bookings = @user.bookings.all.select{|booking| booking.pending?}
    @rejected_bookings = @user.bookings.all.select{|booking| booking.rejected?}
  end
end
