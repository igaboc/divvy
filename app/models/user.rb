class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :listings
  
  has_many :reviews, dependent: :destroy

  # Favorite listings of user
  has_many :favorite_listings  
  has_many :favorites, through: :favorite_listings, source: :listing

end
