class Listing < ApplicationRecord
  include ImageUploader[:image]
  
  belongs_to :owner, :foreign_key => :owner_id, class_name: "User"

  has_many :photos, dependent: :destroy    
  accepts_nested_attributes_for :photos
  # accepts_nested_attributes_for :photos
end
