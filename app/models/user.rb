class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_one :miles_profile
  # validates :first_name, :last_name, :birth_date, presence: true
  # validates :phone, numericality: { only_integer: true }
  validates_uniqueness_of :email, scope: [:first_name, :last_name]
  # mount_uploader :photo, PhotoUploader

  def requests
    bookings_ids = self.miles_profile.bookings.pluck(:id)
    requests = []
    bookings_ids.each do |id|
      requests << Request.where(booking_id: id).first
    end
    return requests
  end
end
