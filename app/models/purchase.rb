class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :items_shipping_method
  has_one :shipping_method, through: :items_shipping_method
  enum status: { pending: 0, accepted: 1, declined: 2}

  validates :quantity, presence: true

end
