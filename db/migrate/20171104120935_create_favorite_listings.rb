class CreateFavoriteListings < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_listings do |t|
      t.integer :listing_id
      t.integer :user_id

      t.timestamps
    end
  end
end
