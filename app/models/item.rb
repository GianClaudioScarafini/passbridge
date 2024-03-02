class Item < ApplicationRecord
  belongs_to :user
  has_many :shipping_method , through: :item_shipping_method
end
