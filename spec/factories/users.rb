FactoryBot.define do
  factory :user, class: User do
    sequence(:nickname)  { |n| "test-user#{n}" }
    sequence(:email)     { |n| "test-user#{n}@example.com" }
    password             { "test123" }
  end

  factory :sample_user, class: User do
    sequence(:nickname)  { "sample-user" }
    sequence(:email)     { "sample-user@example.com" }
    password             { "sample123" }
  end
end
