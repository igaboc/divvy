class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Get rentals that the logged in user has made
    @rentals = Rental.where(renter: current_user)
  end

  def show
  end

  def new
    @rental = Rental.new
    @rental.listing = Listing.find(params[:listing_id])
  end

  def create
    rental_params = params.require(:rental).permit(:listing_id)

    # New rental to save to database
    @rental = Rental.new
    @rental.listing = Listing.find(rental_params[:listing_id])
    @rental.renter = current_user

  # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Divvy - #{@rental.listing.title}',
      :currency    => 'aud'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
