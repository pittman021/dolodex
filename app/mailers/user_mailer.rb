class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = 'dolodex.herokuapp.com'
		mail(to: @user.email, subject: 'Welcome to dolodex!')
	end
end
