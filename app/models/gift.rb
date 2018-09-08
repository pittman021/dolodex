class Gift < ApplicationRecord
	belongs_to :user
	belongs_to :contact

	default_scope { includes(:contact) }
end
