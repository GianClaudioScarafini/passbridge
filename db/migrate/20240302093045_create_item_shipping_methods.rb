class CreateItemShippingMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :item_shipping_methods do |t|
      t.references :item, null: false, foreign_key: true
      t.references :shipping_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
