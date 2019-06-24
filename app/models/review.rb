class Review < ApplicationRecord
  belongs_to :user
  begonds_to :book
end
