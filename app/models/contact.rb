class Contact < ApplicationRecord
	validates_presence_of :first_name, :last_name, :date_of_birth

	belongs_to :user
	has_many :gifts
	has_and_belongs_to_many :lists

	accepts_nested_attributes_for :gifts, :allow_destroy => true
end
