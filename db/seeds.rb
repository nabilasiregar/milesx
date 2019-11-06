# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Request.destroy_all
Booking.destroy_all
MilesProfile.destroy_all
User.destroy_all

seller = User.create!(
  email: "seller@email.com",
  password: "password",
  birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
  phone: Faker::PhoneNumber.phone_number_with_country_code,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  success_rate: rand(78..100)
)

seller_miles_profile = MilesProfile.create!(
  user: seller,
  programme: "Skyrewards",
  amount: rand(10001..20000),
  price: 5
)

buyer = User.create!(
  email: "buyer@email.com",
  password: "password",
  birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
  phone: Faker::PhoneNumber.phone_number_with_country_code,
  first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  success_rate: rand(78..100)
)

# byebug
pending_booking = Booking.create!(
  user: buyer,
  departure: "Singapore",
  arrival: "Paris",
  ticket_received: false,
  price: 10202,
  amount_of_miles: 34567,
  status: "pending",
  departure_date: Date.today + rand(10..20),
  return_date: Date.today + rand(21..30),
  miles_profile_id: seller_miles_profile.id
)

pending_request = Request.create!(
  confirmed: "pending",
  booking: pending_booking
)

declined_booking = Booking.create!(
  user: buyer,
  departure: "Denpasar",
  arrival: "Amsterdam",
  ticket_received: false,
  price: 1022,
  amount_of_miles: 32367,
  status: "decline",
  departure_date: Date.today + rand(10..20),
  return_date: Date.today + rand(21..30),
  miles_profile_id: seller_miles_profile.id
)

declined_request = Request.create!(
  confirmed: "declined",
  booking: declined_booking
)

confirmed_booking = Booking.create!(
  user: buyer,
  departure: "Shanghai",
  arrival: "London",
  ticket_received: false,
  price: 1202,
  amount_of_miles: 345637,
  status: "confirmed",
  departure_date: Date.today + rand(10..20),
  return_date: Date.today + rand(21..30),
  miles_profile_id: seller_miles_profile.id
)

confirmed_request = Request.create!(
  confirmed: "confirmed",
  booking: confirmed_booking
)




10.times do
  user = User.create!(email: Faker::Internet.email, password: "password", birth_date: Faker::Date.birthday(min_age: 18, max_age: 65), phone: Faker::PhoneNumber.phone_number_with_country_code, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, success_rate: rand(78..100))
  puts "Profile has been created"
end

10.times do
  MilesProfile.create!(user: User.all.sample, programme: "Skyrewards", amount: rand(10001..20000), price: 5)
end

10.times do
  booking = Booking.create!(user: User.all.sample, departure: "Shanghai",
  arrival: "London", ticket_received: false, departure_date: Date.today + rand(10..20), return_date: Date.today + rand(21..30), miles_profile_id: MilesProfile.all.sample.id)
end
puts "Booking created"
