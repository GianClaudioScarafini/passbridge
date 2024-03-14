class CreatePurchaseProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_proposals do |t|
      t.string :title
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
