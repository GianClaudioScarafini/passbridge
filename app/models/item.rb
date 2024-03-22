class Item < ApplicationRecord
  belongs_to :user
  has_many :item_shipping_methods
  has_many :shipping_methods, through: :item_shipping_methods
  has_one :purchase

  has_many_attached :images

  validates :name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  before_save :preserve_images

  private

  def preserve_images
    images.purge_later unless images.attached? || images.any?(&:purged?)
  end
end
