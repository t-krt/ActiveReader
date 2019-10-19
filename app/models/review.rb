class Review < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  accepts_nested_attributes_for :tasks

  belongs_to :user
  belongs_to :book

  scope :reading, -> { find_by(review_status: "reading") }
  scope :read, -> { where(review_status: "read") }
  scope :stock, -> { where(review_status: "stock") }
  scope :desc, -> { order(updated_at: "DESC") }
  scope :with_book, -> { includes(:book) }
  scope :with_user, -> { includes(:user) }

  validates :purpose, presence: true
  validates :review_status, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true

  enum review_status: %i[reading read stock]

  def change_state_stock
    self.review_status = "stock"
    save
  end
end
