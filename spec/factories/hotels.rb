# frozen_string_literal: true

FactoryBot.define do
  factory :hotel do
    address { Faker::Address.street_address }
    description { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    name { Faker::Company.name }
    phone { Faker::PhoneNumber.phone_number }
    price_range { Faker::Lorem.word }
    stars { Faker::Number.between(from: 1, to: 5).to_s }
  end
end
