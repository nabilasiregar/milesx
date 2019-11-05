# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

user = User.create(email: "dev@email.com", password: "password", birth_date: Faker::Date.birthday(min_age: 18, max_age: 65), phone: Faker::PhoneNumber.phone_number_with_country_code, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, success_rate: rand(78..100))


10.times do
  user = User.create(email: Faker::Internet.email, password: "password", birth_date: Faker::Date.birthday(min_age: 18, max_age: 65), phone: Faker::PhoneNumber.phone_number_with_country_code, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, success_rate: rand(78..100))
  puts "Profile has been created"
end

10.times do
  MilesProfile.create(user: User.all.sample, programme: "Skyrewards", amount: rand(10001..20000), price: 5)
end

10.times do
  booking = Booking.create(user: User.all.sample, approved: false, departure_date: Date.today + rand(10..20), return_date: Date.today + rand(21..30), miles_profile: MilesProfile.all.sample)
end
puts "Booking created"
