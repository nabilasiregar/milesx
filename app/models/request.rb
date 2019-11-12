class Request < ApplicationRecord
  belongs_to :booking
  mount_uploader :photo, PhotoUploader

  # validates :confirmed, presence: true
end
