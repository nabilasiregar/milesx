class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :departure
      t.string :arrival
      t.date :departure_date
      t.date :return_date
      t.integer :price
      t.string :status
      t.boolean :ticket_received
      t.integer :amount_of_miles
      t.references :user, foreign_key: true
      t.references :miles_profile, foreign_key: true

      t.timestamps
    end
  end
end
