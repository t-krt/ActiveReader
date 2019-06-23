class Category < ApplicationRecord
  has_many :books, though: :book_categories
  has_many :book_categories, dependent: :destroy
end
