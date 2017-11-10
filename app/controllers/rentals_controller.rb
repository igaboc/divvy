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

  def edit
    rental_params = params.permit(:listing_id)
    @rental = Rental.find(params[:id])

    @amount = @rental.total_price_cents
  end

  def update
    @rental = Rental.find(params[:id])
    @amount = @rental.total_price_cents
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

    @rental.charge_identifier = charge.id
    @rental.save


    respond_to do |format|
      if @rental.save
        format.html { redirect_to listing_rentals_path, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path(listing_id: @rental.listing.id)
    
  end

  def create
    rental_params = params.require(:rental).permit(:listing_id, :start_date, :end_date)

    # New rental to save to database
    @rental = Rental.new
    @rental.listing = Listing.find(rental_params[:listing_id])
    @rental.renter = current_user
    @rental.deposit_paid = @rental.listing.deposit
    @rental.applied_rate = @rental.listing.rental_fee
    @rental.start_date = rental_params[:start_date]
    @rental.end_date = rental_params[:end_date]


    respond_to do |format|
      if @rental.save
        format.html { redirect_to edit_listing_rental_path(@rental.listing, @rental), notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

end
