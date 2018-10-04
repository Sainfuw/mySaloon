class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.decimal :price, precision: 19, scale: 4
      t.integer :status
      t.references :author, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
