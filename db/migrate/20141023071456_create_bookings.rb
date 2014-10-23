class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|

      t.string  :name,             :null => false
      t.date    :booking_date,     :null => false
      t.integer :fees,             :null => false
      t.integer :status,           :null => false,    :default => true

      t.timestamps
    end
  end
end
