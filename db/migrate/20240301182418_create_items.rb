class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :location
      t.integer :quantity
      t.float :price
      t.string :condition
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.float :co2_emitions
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
