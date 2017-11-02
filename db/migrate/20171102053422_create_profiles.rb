class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.text :image_data
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
