class Contact < ApplicationRecord
	require 'csv'

	validates_presence_of :first_name, :last_name

	belongs_to :user
	has_many :gifts, dependent: :destroy
	has_and_belongs_to_many :lists

	accepts_nested_attributes_for :gifts, :allow_destroy => true

	def self.import(file)
		# a block the runs through a loop in our CSV data

		CSV.foreach(file.path, headers: true, :header_converters => :symbol ) do |row|
		# creates a user for each row in the CSV file
		Contact.create! row.to_hash
end
end
end
