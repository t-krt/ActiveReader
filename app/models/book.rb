class Book < ApplicationRecord
  has_many :categories, though: :book_categories
  has_many :book_categories, dependent: :destroy
end
