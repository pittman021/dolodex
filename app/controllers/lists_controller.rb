class ListsController < ApplicationController

	def index
		@list = List.new
		@lists = current_user.lists.all
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

	def update
		@list = List.find(params[:id])

		respond_to do |format|
		if @list.update(list_params)
			format.html { redirect_to lists_path, notice: 'List was successfully updated.' }
			  format.json { render :json => @list.to_json, status: :ok, location: @list }
		else
			format.html { render root_path, notice: "Uh oh, something went wrong" }
			format.json { render json: @list.errors, status: :unprocessable_entity }
	end
end
end

	def show
		@list = List.find(params[:id])
		@contacts = @list.contacts
		@contact_ids = @list.contacts.pluck(:id)
		@contacts_available = current_user.contacts.all
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		render json: { status: :ok, message: 'List Deleted'}
	end

	def list_params
		 params.require(:list).permit(:id, :user_id, :name, contact_ids: [], contacts_attributes: [])
	end
end
