# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
	:name                  => 'Tim',
	:email                 => "tim.pittman021@gmail.com",
	:password              => "grateful87",
	:password_confirmation => "grateful87"
 )
 user.save!

 puts 'tim.pittman021@gmail.com user created'


 Group.create!(
		title: 'Family'
	)

 3.times do |contact|
	 Contact.create!(
	 	first_name: "Katharine #{contact}",
		last_name: "Mohana #{contact}",
		birthday_month: 10,
		birthday_day: 8,
		address: '1609 Sunset Lane, Austin TX, 78704',
		user_id: 1,
		group_id: 1
	 )

 end

	 puts 'three katharines created'

	 3.times do |gift|
		 Gift.create!(
		 	title: "New Balance Shoe #{gift}",
			url: 'newbalance.com',
			user_id: 1,
			contact_id: 1
		 )
	 end

		 puts '3 gifts created'
