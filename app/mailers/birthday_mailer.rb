class BirthdayMailer < ApplicationMailer

	def upcoming_birthday_notification(contact)
		@user = User.find(contact.user_id)
		@contact = contact
		@url = 'dolodex.herokuapp.com'
		mail(to: @user.email, subject: "#{@contact.first_name} #{@contact.last_name}'s birthday is in 2 weeks!")
	end
end
