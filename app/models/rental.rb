class Rental < ApplicationRecord
  belongs_to :renter
  belongs_to :listing
end
