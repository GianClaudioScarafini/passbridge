class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  enum status: { pending: 0,
                 accepted: 1,
                 declined: 2}
end
