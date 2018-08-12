# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u=User.new(:name => 'Anonymous', :email => 'anonymous@gmail.com', :phone => '9898989898', :role => 2)

i=Incident.new(
	:incident_types => ['Alcohol','Hazing'], 
	:people_involved => 'me & my friends', 
	:other_observers => 'public observers', 
	:observed_at => DateTime.now, 
	:incident_location => 2, 
	:incident_location_details => 'details about location', 
	:incident_description => 'lorem lipsum'
	)
i.user = u
i.save