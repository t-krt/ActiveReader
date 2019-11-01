class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review
  validates :nickname, presence: true, uniqueness: true

  # 自分の投稿であるかどうか、及び既にいいねしたレビューかどうかを確認
  def likable_for?(review)
    review && review.user != self && !likes.exists?(review_id: review_id)
  end
end
