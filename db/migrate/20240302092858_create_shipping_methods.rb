class CreateShippingMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_methods do |t|
      t.float :co2_ratio
      t.integer :method

      t.timestamps
    end
  end
end
