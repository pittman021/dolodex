module ApplicationHelper

	def flash_class(level)
    case level
        when :notice then "notice is-primary"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
end
end
