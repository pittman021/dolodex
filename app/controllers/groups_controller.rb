class GroupsController < ApplicationController

	before_action :authenticate_user!

	def index
		@group = Group.new
		@groups = current_user.groups.all

	end

	def create
		@group = current_user.groups.new(group_params)

		respond_to do |format|
			if @group.save
				format.html { redirect_to groups_path, notice: "Your gift was added. Gosh, so generous" }
			else
				format.html { redirect_to groups_path, notice: "Uh oh, something went wrong " }
			end
		end
	end

	def group_params
		 params.require(:group).permit(:title, :user_id)
	end

end
