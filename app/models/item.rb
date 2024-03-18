class Item < ApplicationRecord
  belongs_to :user
  has_many :item_shipping_methods
  has_many :shipping_methods , through: :item_shipping_methods

  has_many_attached :images

  validates :name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  <<<<<<< HEAD
  def self.search(search)
    if search
      user_type = User.find_by(name: search)
        if user_type
          self.where(user_id: user_type)
        else
        @items = Item.all
        end
    else
      @items = Item.all
    end
  end
=======
  validates :name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, presence: true
<<<<<<< HEAD
>>>>>>> 969ea09bcb0f718f42df242a21606e0c72ec7ce4
=======

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
>>>>>>> 2697ebdca69c102488a851592a784bee5d036b07
end
