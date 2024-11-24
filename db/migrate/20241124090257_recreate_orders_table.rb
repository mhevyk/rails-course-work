class RecreateOrdersTable < ActiveRecord::Migration[7.2]
  def change
    # Drop the existing orders table if it exists
    drop_table :orders, if_exists: true

    # Create a new orders table with the specified columns
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :address, null: false
      t.string :delivery_method, null: false
      t.string :payment_method, null: false

      t.timestamps
    end
  end
end
