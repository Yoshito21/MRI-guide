FactoryBot.define do
  factory :contact do
    name    { Faker::Name.initials(number: 2) }
    email   { Faker::Internet.free_email }
    message { Faker::Lorem.paragraph }
  end
end
