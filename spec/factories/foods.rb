FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Food #{n}" }
    calories 20
  end
end
