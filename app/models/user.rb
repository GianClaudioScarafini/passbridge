class User < ApplicationRecord

  before_save :update_full_address

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def update_full_address
    if self.address.nil?
      self.address = "Germany Berlin"
    else
      self.address = "#{self.address} #{self.city} #{self.nation}"
    end
  end
end
