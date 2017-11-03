class Listing < ApplicationRecord
  include ImageUploader[:image]
  
  belongs_to :owner, :foreign_key => :owner_id, class_name: "User"

  has_many :photos, dependent: :destroy    
  accepts_nested_attributes_for :photos
  # accepts_nested_attributes_for :photos

  CATEGORY_TYPES = ["Boats and Jet Skis", "Books, Music and Games", "Cars and Vehicles", "Clothing", "Electronics and Computer", "Home and Garden", "Miscellaneous", "Sport and Fitness"]
end
