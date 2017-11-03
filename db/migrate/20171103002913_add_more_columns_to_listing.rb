class AddMoreColumnsToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :rental_fee, :decimal
    add_column :listings, :deposit, :decimal
  end
end
