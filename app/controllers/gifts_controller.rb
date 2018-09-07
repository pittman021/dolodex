class GiftsController < ApplicationController

	before_action :authenticate_user!

	def index
		@gifts = Gift.includes(:contact).where(user_id: current_user.id)


	end
end
