class GiftsController < ApplicationController

	before_action :authenticate_user!

	def index
		@gifts = current_user.gifts
	end

	def new
		@gift = Gift.new
	end

	def show
		@gift = Gift.find(params[:id])
	end

	def edit
		@gift = Gift.find(params[:id])
	end

	def update
		@gift = Gift.find(params[:id])
		respond_to do |format|
			if @gift.update(gift_params)
				format.html { redirect_to gifts_path, notice: 'Gift was successfully updated.' }
			else
				format.html { render :edit, notice: "Uh oh, something went wrong" }
			end
		end
	end

	def destroy
		@gift = Gift.find(params[:id])
		@gift.destroy
		redirect_to gifts_path
	end

		def create
			@gift = current_user.gifts.new(gift_params)

			respond_to do |format|
				if @gift.save
					format.html { redirect_to gifts_path, notice: "Your gift was added. Gosh, so generous" }
				else
					format.html { redirect_to gifts_path, notice: "Uh oh, something went wrong " }
				end
			end
		end

		def gift_params
			params.require(:gift).permit(:title, :url, :contact_id)
		end


end
