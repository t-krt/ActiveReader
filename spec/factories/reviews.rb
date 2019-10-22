FactoryBot.define do
  factory :review do
    purpose        { "For my growth" }
    review_status  { "reading" }
    association :user, factory: :user, id: 2
    association :book, factory: :book, id: 1
  end
end
