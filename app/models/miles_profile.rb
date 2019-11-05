class MilesProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :programme, presence: true
  validates :amount, presence: true
  validates :price, presence: true
end
