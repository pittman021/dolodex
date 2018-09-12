namespace :notifications do
		desc "Send users birthday reminders for their contacts"
		task :send_birthday_reminder => :environment do
			Contact.all.each do |c|
				bday = Date.new(Date.today.year, c.birthday_month, c.birthday_daygit pus)
				puts c.first_name + c.last_name
				bday += 1.year if Date.today >= bday

				is_two_weeks = Date.today + 14.days
				days_until = (bday - Date.today)

				if days_until == 14
					BirthdayMailer.upcoming_birthday_notification(c).deliver
				end
			end
	end
end
