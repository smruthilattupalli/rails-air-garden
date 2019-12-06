class AddBookingTypeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booking_type, :string
  end
end
