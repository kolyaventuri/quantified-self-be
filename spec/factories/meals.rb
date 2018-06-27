FactoryBot.define do
  factory :meal do
    sequence(:name) { |n| "Meal #{n}" }
  end
end
