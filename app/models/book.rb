class Book < ApplicationRecord
  has_many :categories, through: :book_categories
  has_many :book_categories, dependent: :destroy, inverse_of: :book
  accepts_nested_attributes_for :book_categories

  has_many :reviews
  accepts_nested_attributes_for :reviews

  validates :title, presence: true

  enum genre: [:literature, :nonfiction, :practical, :science, :it, :art, :entertainment, :other]
end
