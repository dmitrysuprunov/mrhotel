class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|


      t.string  :name
      t.string  :email
      t.date    :checkin_date
      t.date    :checkout_date

      t.timestamps
    end
  end
end
