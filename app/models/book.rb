class Book < ApplicationRecord
  has_many :reviews, dependent: :restrict_with_error
  accepts_nested_attributes_for :reviews
  validates :title, presence: true

  enum genre: %i[literature nonfiction practical science it art entertainment other]
end
