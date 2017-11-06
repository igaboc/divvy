class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :favorite]
  before_action :authenticate_user!, only: [:favorite]

  # Add and remove favorite listings
  # for current_user
  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @listing
      redirect_to @listing, notice: 'Added To Favorites'

    elsif type == "unfavorite"
      current_user.favorites.delete(@listing)
      redirect_to @listing, notice: 'Removed From Favorites'

    else
      # Type missing, nothing happens
      redirect_to @listing, notice: 'Nothing happened.'
    end
  end


  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @reviews = Review.where(listing_id: @listing.id).order("created_at DESC")
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save

      # Get photos directly from the params and save them to the database one by one
      if params[:listing][:images]
        params[:listing][:images].each { |image|
          Photo.create(listing: @listing, image: image)
        }
      end

        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)

      # Get photos directly from the params and save them to the database one by one
        if params[:listing][:images]
          params[:listing][:images].each { |image|
            Photo.create(listing: @listing, image: image)
          }
        end

        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :owner_id, :return_time, :category, :rental_fee, :deposit, :city, :state, :country)
    end
end
