class ListsController < ApplicationController

	def index
		@list = List.new
		@lists = List.all
	end

	def create
		@list = current_user.lists.new(list_params)

		respond_to do |format|
			if @list.save
				format.html { redirect_to lists_path, notice: "Your list was added. Gosh, so generous" }
			else
				format.html { redirect_to list_path, notice: "Uh oh, something went wrong " }
			end
		end
	end

	def show
		@list = List.includes(:contacts).find(params[:id])
	end

	def list_params
		 params.require(:list).permit(:name)
	end


end
