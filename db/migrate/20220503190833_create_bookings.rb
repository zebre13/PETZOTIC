class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.datetime :starting_date
      t.datetime :ending_date
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
