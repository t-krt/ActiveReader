class BookCategory < ApplicationRecord
  belongs_to :book
  begonds_to :category
end
