class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.references :owner, foreign_key: {to_table: :users}
      t.time :return_time

      t.timestamps
    end
  end
end
