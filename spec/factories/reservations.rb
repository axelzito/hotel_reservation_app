FactoryBot.define do
  factory :reservation do
    association :hotel, factory: :hotel
    price { Faker::Commerce.price(range: 100.0..500.0, as_string: true) }
    currency { Faker::Currency.code }
    check_in { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    check_out { Faker::Date.between(from: check_in, to: 2.years.from_now) }
    guest_name { Faker::Name.name }
    guest_email { Faker::Internet.email }
  end
end
