class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    change_table :carts do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
