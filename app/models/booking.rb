class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  enum status: [ :pending, :accepted, :rejected ]

  validate :starting_date_dont_overlap

  private

  def starting_date_dont_overlap
    return if self.class.where.not(id: id).where(pet_id: pet_id).where('starting_date <= ? AND ending_date >= ?', ending_date, starting_date).none?
    errors.add(:base, 'Overlapping reservation exists')
  end
end
