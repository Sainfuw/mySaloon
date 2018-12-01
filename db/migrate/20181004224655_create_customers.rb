class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :status
      t.references :author, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
