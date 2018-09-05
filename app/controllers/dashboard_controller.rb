class DashboardController < ApplicationController

	def index
		@lists = current_user.lists.all
    @birthdays = current_user.contacts.where("birthday_month >= ? AND birthday_month <= ?", Time.now.month, (Time.now + 1.month).month).order(:birthday_month)
end

end
