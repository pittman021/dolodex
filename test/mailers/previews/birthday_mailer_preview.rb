class BirthdayMailerPreview < ActionMailer::Preview

  def upcoming_birthday_notification
    BirthdayMailer.upcoming_birthday_notification(Contact.last)
	end
end
