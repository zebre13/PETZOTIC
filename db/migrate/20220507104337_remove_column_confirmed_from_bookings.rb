class RemoveColumnConfirmedFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :confirmed
  end
end
