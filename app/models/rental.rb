class Rental < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  belongs_to :listing

  def calc_days(start_date, end_date)
    difference = end_date - start_date
    difference.to_i
  end

  def sub_total
    duration = self.calc_days(self.start_date, self.end_date)
  
    total = duration * self.applied_rate
  end

  def total_price
    duration = self.calc_days(self.start_date, self.end_date)

    total = self.deposit_paid + (duration * self.applied_rate)
  end

  def total_price_cents
    duration = self.calc_days(self.start_date, self.end_date)

    total = self.deposit_paid + (duration * self.applied_rate)
    (total*100).to_i
  end

end
