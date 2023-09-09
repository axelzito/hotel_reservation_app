# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    association :hotel, factory: :hotel
    price { Faker::Commerce.price(range: 100.0..500.0, as_string: true) }
    currency { Faker::Currency.code }
    check_in { Faker::Date.between(from: 1.month.ago, to: Time.zone.now) }
    check_out { Faker::Date.between(from: check_in + 1.day, to: check_in + 10.days) }
    guest_name { Faker::Name.name }
    guest_email { Faker::Internet.email }
  end
end
