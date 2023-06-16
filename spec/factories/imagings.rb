FactoryBot.define do
    factory :imaging do
      site_id { Faker::Number.between(from: 1, to: 10) }
      purpose { Faker::Lorem.paragraph }
    end
  end