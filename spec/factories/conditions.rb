FactoryBot.define do
  factory :condition do
    location_id    { Faker::Number.between(from: 1, to: 7) }
    contrast_id    { Faker::Number.between(from: 1, to: 17) }
    suppression_id { Faker::Number.between(from: 1, to: 5) }
    enhance_id     { Faker::Number.between(from: 1, to: 3) }
  end
end