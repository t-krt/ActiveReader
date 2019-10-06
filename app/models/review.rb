class Review < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  accepts_nested_attributes_for :tasks

  belongs_to :user
  belongs_to :book

  scope :reading, -> { find_by(review_status: "reading") }
  scope :read, -> { where(review_status: "read") }
  scope :stock, -> { where(review_status: "stock") }

  validates :purpose, presence: true
  validates :review_status, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true

  enum review_status: %i[reading read stock]
end
