class RemoveDefaultFromConfirmed < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :confirmed, from: false, to: nil
  end
end
