FactoryBot.define do
  factory :user do
    sequence(:nickname)  { |n| "test-user#{n}" }
    sequence(:email)     { |n| "test-user#{n}@example.com" }
    password             { "test123" }
  end
end
