class HomeController < ApplicationController
  def index
    @listing_five = Listing.find(5)
    @listing_nine = Listing.find(9)
    @listing_eight = Listing.find(8)    
  end
end
