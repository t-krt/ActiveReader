class Review < ApplicationRecord
  has_many :tasks
  accepts_nested_attributes_for :tasks

  belongs_to :user
  belongs_to :book

  validates :purpose, presence: true
  validates :review_status, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true

  enum review_status: [:reading, :read, :stock]
end
