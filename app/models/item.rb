class Item < ApplicationRecord
  belongs_to :user
  has_many :item_shipping_methods
  has_many :shipping_methods , through: :item_shipping_methods

  validates :name, :location, :description, :price, :condition, :quantity, :start_date, :end_date presence: true

end
