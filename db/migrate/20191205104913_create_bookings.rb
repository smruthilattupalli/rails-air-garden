class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :garden, foreign_key: true
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.float :total_price
      t.string :status, default: 'Pending'

      t.timestamps
    end
  end
end
