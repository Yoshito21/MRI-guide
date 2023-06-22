FactoryBot.define do
  factory :machine do
    manufacturer_id { Faker::Number.between(from: 1, to: 5) }
    strength_id     { Faker::Number.between(from: 1, to: 6) }
    name            { Faker::Name.initials(number: 2)}
  end
end