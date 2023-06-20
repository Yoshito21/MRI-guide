FactoryBot.define do
  factory :occupation do
    name           { Faker::Name.initials(number: 2)}
    post_code      { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    phone_number   { Faker::Number.decimal_part(digits: 11) }
    prefecture1_id { Faker::Number.between(from: 1, to: 47) }
  end
end