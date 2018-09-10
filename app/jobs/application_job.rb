class ApplicationJob < ActiveJob::Base

	def send_birthday_mailer(contact)
		@contact = contact
		BirthdayMailer.upcoming_birthday_notification(@contact).deliver
end
