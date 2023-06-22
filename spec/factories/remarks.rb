FactoryBot.define do
  factory :remark do
    content { Faker::Lorem.paragraph }
  end
end
