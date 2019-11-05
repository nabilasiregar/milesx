class Payment < ApplicationRecord
  belongs_to :booking
  #validates :released?
end
