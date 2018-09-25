class Group < ApplicationRecord
	has_many :contacts
	belongs_to :user
end
