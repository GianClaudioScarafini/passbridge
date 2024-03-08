class ShippingMethod < ApplicationRecord
  enum method: {
    foot:                0,
    bike:                1,
    airplane:            2,
    car:                 3,
    motorcycle:          4,
    electric_motorcycle: 5,
    electric_car:        6,
    truck:               7,
    drone:               8
  }
end
