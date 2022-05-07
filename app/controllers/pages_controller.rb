class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @accepted_bookings = @user.bookings.select{|booking| booking.accepted?}
    @pending_bookings = @user.bookings.all.select{|booking| booking.pending?}
    @pending_bookings_as_owner = @user.bookings_as_owner.select{|booking| booking.pending?}
    @accepted_bookings_as_owner = @user.bookings_as_owner.select{|booking| booking.accepted?}
    @rejected_bookings = @user.bookings.all.select{|booking| booking.rejected?}
  end
end
