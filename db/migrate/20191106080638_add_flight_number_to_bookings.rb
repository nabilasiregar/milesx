class AddFlightNumberToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :flight_number, :string
  end
end
