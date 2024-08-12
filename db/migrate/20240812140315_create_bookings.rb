class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :date_start_on
      t.date :date_end_on
      t.references :user, null: false, foreign_key: true
      t.references :emoji, null: false, foreign_key: true

      t.timestamps
    end
  end
end
