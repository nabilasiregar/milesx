class AddSeatClassToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :seat_class, :string
  end
end
