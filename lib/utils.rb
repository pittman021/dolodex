module Utils

	def self.is_upcoming_birthday(contact)
		bday = Date.new(Date.today.year, contact.birthday_month, contact.birthday_day)
		bday += 1.year if Date.today >= bday

		is_two_weeks = Date.today + 14.days
		days_until = (bday - Date.today)

		if days_until == 14
			BirthdayMailer.upcoming_birthday_notification(contact)
			puts 'sending over to the mailer'
		end
	end
end
