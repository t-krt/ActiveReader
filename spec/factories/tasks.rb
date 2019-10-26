FactoryBot.define do
  factory :task do
    content { "sample-task" }
    association :review, factory: :review, id: 3
  end
end
