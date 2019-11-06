class Request < ApplicationRecord
  belongs_to :booking

  def seller
    self.booking.miles_profile.user
  end
end
