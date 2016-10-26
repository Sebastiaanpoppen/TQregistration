class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.datetime :checkin

      t.timestamps
    end
  end
end
