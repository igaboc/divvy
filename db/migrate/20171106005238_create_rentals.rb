class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.references :renter, foreign_key: {to_table: :users}
      t.references :listing, foreign_key: true
      t.string :charge_identifier

      t.timestamps
    end
  end
end
