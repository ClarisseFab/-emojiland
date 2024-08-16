class AddPriceBookingToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :price_booking, :float
  end
end
