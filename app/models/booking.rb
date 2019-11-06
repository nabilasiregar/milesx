class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :miles_profile
  has_many :payments
  has_many :passengers
  has_many :requests

  validates :departure_date, :return_date, presence: true
  validates :departure, presence: true
  validates :arrival, presence: true

  private

  def end_date_after_start_date
    return if departure_date.blank? || return_date.blank?

    if return_date < departure_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
