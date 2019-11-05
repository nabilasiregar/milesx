class Passenger < ApplicationRecord
  belongs_to :booking

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
end
