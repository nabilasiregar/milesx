class Request < ApplicationRecord
  belongs_to :booking

  # validates :confirmed, presence: true
end
