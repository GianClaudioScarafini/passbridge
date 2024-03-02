class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :shipping_method, null: false, foreign_key: true
      t.integer :quantity
      t.float :distance
      t.float :total_co2_emitions
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end
