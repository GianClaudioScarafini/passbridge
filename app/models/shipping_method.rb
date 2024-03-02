class ShippingMethod < ApplicationRecord
  belongs_to :item , through: :item_shipping_method
  belongs_to :purchase , through: :item_shipping_method
  enum method = {
    foot: 0,
    bike: 1,
    airplane: 2,
    car: 3,
    motorcycle: 4,
    electric_motorcycle: 5,
    electric_car: 4,
    truck: 5,
    drone: 6
  }
end
