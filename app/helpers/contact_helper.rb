module ContactHelper

	def get_month(date)
		Date::MONTHNAMES[date]
	end

end
