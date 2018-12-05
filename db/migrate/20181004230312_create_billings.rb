class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.string :code
      t.string :payment_method
      t.decimal :amount, precision: 19, scale: 4
      t.string :currency
      t.text :comment
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
