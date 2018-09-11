module Utils

	def self.send_birthday_reminders


		@contacts.each do |c|

			bday = Date.new(Date.today.year, c.birthday_month, c.birthday_day)
			bday += 1.year if Date.today >= bday

			is_two_weeks = Date.today + 14.days
			days_until = (bday - Date.today)

			if days_until == 14
				BirthdayMailer.upcoming_birthday_notification(c)
			end
		end
	end
end
