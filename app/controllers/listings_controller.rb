class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def show
		@Listing = Listing.find(params[:id])
	end

	def new
		@listing = Listing.new
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def create
		@listing = Listing.new(listing_params)

		if @listing.save
			redirect_to listings_url
		else
			render :new
		end
		
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end 

	private
	def listing_params
		params.require(:listing).permit(
			:address,
			:bedrooms,
			:bathrooms,
			:price,
			:square_feet,
			:city,
			:province,
			:description,
			:postal_code
			)
	end

end
