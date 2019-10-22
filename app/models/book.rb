class Book < ApplicationRecord
  has_many :reviews, dependent: :restrict_with_error
  accepts_nested_attributes_for :reviews
  validates :title, presence: true
  validates :author, presence: true

  scope :read, -> { where(review_status: "read") }
  scope :desc, -> { order(updated_at: "DESC") }
end
