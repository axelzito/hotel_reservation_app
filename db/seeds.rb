# frozen_string_literal: true

Reservation.destroy_all
Hotel.destroy_all
hotels = []

10.times do
  hotel = Hotel.create(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    stars: rand(1..5).to_s,
    price_range: %w[$ $$ $$$ $$$$].sample,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    description: Faker::Lorem.paragraph
  )

  hotels << hotel&.id
end

200.times do
  Reservation.create(
    price: rand(100..500).to_s,
    currency: %w[€ U$D].sample,
    check_in: Faker::Date.forward(days: 30),
    check_out: Faker::Date.forward(days: 60),
    guest_name: Faker::Name.name,
    guest_email: Faker::Internet.email,
    hotel: hotels.sample
  )
end

p 'Seed data created successfully!'
