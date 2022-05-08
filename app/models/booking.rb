class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  enum status: [ :pending, :accepted, :rejected ]
  # validate :reservations_must_not_overlap

  # private

  # def reservations_must_not_overlap
  #   return if self.class
  #                 .where.not(id: id)
  #                 .where(pet_id: pet_id)
  #                 .where('starting_date < ? AND ending_date > ?', ending_date, starting_date)
  #                 .none?
  #   flash.alert = "Overlapping reservation exists."
  #   errors.add(:base, 'Overlapping reservation exists')
  end
end
