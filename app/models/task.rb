class Task < ApplicationRecord
  belongs_to :review

  validates :content, presence: true
end
