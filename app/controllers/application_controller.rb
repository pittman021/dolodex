class ApplicationController < ActionController::Base

	## allows me to set devise & external page layouts
	layout :layout_by_resource

	include DeviseWhitelist

	def layout_by_resource
		if devise_controller?
			"pages"
		else
			"application"
		end
	end
end
