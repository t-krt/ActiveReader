class Task < ApplicationRecord
  belongs_to :review

  validates :task_content, presence: true
end
