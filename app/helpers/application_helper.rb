module ApplicationHelper

	def flash_class(level)
    case level
        when :notice then "notice is-primary box cta"
        when :success then "alert alert-success box cta"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
end
end
