class Item < ApplicationRecord
  belongs_to :user
  has_many :item_shipping_methods
  has_many :shipping_methods, through: :item_shipping_methods
  has_many :purchases

  has_many_attached :images

  validates :name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
<<<<<<< HEAD

  before_save :preserve_images

  def remaining_quantity
    purchases_quantity = self.purchases.sum(:quantity)
    self.quantity - purchases_quantity
  end

  private

  def preserve_images
    images.purge_later unless images.attached? || images.any?(&:purged?)
  end
=======
>>>>>>> 1e624d0696f71d5a44045d98b5ee200eb1408604
end
