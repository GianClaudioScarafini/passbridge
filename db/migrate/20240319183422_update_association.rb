class UpdateAssociation < ActiveRecord::Migration[7.1]
  def change
    remove_column :purchases , :shipping_method_id, :bigint
    add_reference :item_shipping_methods, :purchase, foreign_key: true
  end
end
