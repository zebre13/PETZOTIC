class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  enum status: [ :pending, :accepted, :rejected ]

end
