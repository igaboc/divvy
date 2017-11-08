class Rental < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  belongs_to :listing

  def calc_days(start_date, end_date)
    difference = end_date - start_date
    difference.to_i
  end

end
