class ItemShippingMethod < ApplicationRecord
  belongs_to :item
  belongs_to :purchase
  belongs_to :shipping_method
end
