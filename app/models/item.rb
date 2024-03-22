class Item < ApplicationRecord
  belongs_to :user
  has_many :item_shipping_methods
  has_many :shipping_methods , through: :item_shipping_methods

  has_many_attached :images

  validates :name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
