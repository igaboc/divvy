class Listing < ApplicationRecord
  include ImageUploader[:image]
  
  belongs_to :owner, :foreign_key => :owner_id, class_name: "User"

  has_many :photos, dependent: :destroy    
  accepts_nested_attributes_for :photos
  # accepts_nested_attributes_for :photos

  # Favorited by users
  has_many :favorite_listings  # just the 'relationships'
  has_many :favorited_by, through: :favorite_listings, source: :user # the actual users favoriting a listing

  CATEGORY_TYPES = ["Boats and Jet Skis", "Books, Music and Games", "Cars and Vehicles", "Clothing", "Electronics and Computer", "Home and Garden", "Miscellaneous", "Sport and Fitness"]

  STATE_TYPES = ["NSW", "NT", "QLD", "SA", "TAS", "VIC", "WA"]

  COUNTRY_TYPES = ["Australia"]
end
