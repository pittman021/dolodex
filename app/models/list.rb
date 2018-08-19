class List < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :contacts

	accepts_nested_attributes_for :contacts, :allow_destroy => true

end
