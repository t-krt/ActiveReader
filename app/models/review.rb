class Review < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  accepts_nested_attributes_for :tasks

  belongs_to :user
  belongs_to :book
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  scope :desc, -> { order(updated_at: "DESC") }
  scope :with_book, -> { includes(:book) }
  scope :with_user, -> { includes(:user) }
  scope :with_likers, -> { includes(:likers) }
  # reviews_controllerのindexアクションに使用
  scope :with_book_user_likers, -> { with_book.with_user.with_likers.desc }
  # books_controllerのindexアクションに使用
  scope :with_book_likers, -> { with_user.with_likers.desc }

  validates :purpose, presence: true
  validates :review_status, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true

  enum review_status: %i[reading read stock]

  def change_state_stock
    self.review_status = "stock"
    save
  end

  # レビューに対する「いいね」をつくる
  def like(user)
    likes.create(user_id: user.id)
  end

  # レビューについた「いいね」を削除する
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがいいねしていたらtrueを返す
  def after_like?(user)
    likers.include?(user)
  end
end
