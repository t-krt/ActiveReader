class Book < ApplicationRecord
  has_many :reviews
  accepts_nested_attributes_for :reviews
  validates :title, presence: true

  enum genre: [:literature, :nonfiction, :practical, :science, :it, :art, :entertainment, :other]
end
