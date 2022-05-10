class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  enum status: [ :pending, :accepted, :rejected ]

  validate :starting_date_dont_overlap

  private

  def starting_date_dont_overlap
    # pet.bookings.each do |booking|
    #   break if starting_date >= booking.starting_date && starting_date <= booking.ending_date
    # end
    return if self
              .class
              .where(pet_id: pet_id)
              .where('starting_date < ? AND ending_date > ?', ending_date, starting_date)
              .none?
    errors.add(:base, 'Overlapping reservation exists')
  end

  # def dates_are_correct?
  # #   return if ending_date.blank? || starting_date.blank?

  # #   pet.bookings.each do |booking|
  # #     # return false if starting_date >= booking.starting_date && starting_date <= booking.ending_date
  # #     # return false if ending_date >= booking.starting_date && ending_date <= booking.ending_date

  # #     # return false if ending_date < booking.starting_date && starting_date < ending_date
  # #   end
  # # end
  # # # end
  #   false
  # end
end
