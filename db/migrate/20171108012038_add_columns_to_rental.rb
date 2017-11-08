class AddColumnsToRental < ActiveRecord::Migration[5.1]
  def change
    add_column :rentals, :start_date, :date
    add_column :rentals, :end_date, :date
    add_column :rentals, :applied_rate, :decimal
    add_column :rentals, :deposit_paid, :decimal
    add_column :rentals, :returned_at, :time
  end
end
