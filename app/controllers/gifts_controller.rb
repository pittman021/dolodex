class GiftsController < ApplicationController

	before_action :authenticate_user!

	def index
		@gifts = Gift.all
	end
end
