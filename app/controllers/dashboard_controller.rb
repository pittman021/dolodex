class DashboardController < ApplicationController

	def index
		@contacts_count = current_user.contacts.count
		@lists_count = current_user.lists.count

		@lists = current_user.lists.all
    @birthdays = current_user.contacts.where("birthday_month >= ? AND birthday_month <= ?", Time.now.month, (Time.now + 1.month).month).order(:birthday_month)

end

end
