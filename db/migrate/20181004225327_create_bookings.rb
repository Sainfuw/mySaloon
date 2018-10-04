class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.text :formula
      t.text :comment
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :status
      t.references :user, foreign_key: true
      t.references :author, index: true, foreign_key: {to_table: :users}
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
