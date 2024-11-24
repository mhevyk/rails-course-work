class CreateComments < ActiveRecord::Migration[7.2]
  def change
    change_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
