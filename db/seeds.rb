# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
User.destroy_all


#Création de 10 utilisateurs aléatoires portant chacun une des villes précedemment crées en argument foreign key
	random_user_list = []
10.times do
	a = Faker::Alphanumeric.alpha(number: 10)
	random_user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 9, supplemental: false, random_words_to_add: 10), email: "#{a}@yopmail.com", password: Faker::Internet.password(min_length: 10, max_length: 20))
	random_user_list << random_user
end

#Création de 20 event aléatoires portant chacun un user aléatoire précedemment crée en argument foreign key
	random_events_list = []
20.times do
	random_event = Event.create(start_date: Faker::Time.forward(days: 365), duration: rand(4..50)*5, title: Faker::Lorem.sentence(word_count: 5, supplemental: false, random_words_to_add: 3), description: Faker::Lorem.sentence(word_count: 40, supplemental: false, random_words_to_add: 10), price: rand(100), location: Faker::Nation.capital_city, user_id: random_user_list.sample.id)
	random_events_list << random_event
end