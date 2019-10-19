require 'rails_helper'

RSpec.describe Review, type: :model do
  # 目的、状態、book_id, user_idがあれば有効であること
  it "is valid with a purpose, review_status, book_id and user_id" do
    expect(FactoryBot.build(:review)).to be_valid
  end

  # 目的がなければ無効な状態であること
  it "is invalid without a purpose" do
    review = FactoryBot.build(:review, purpose: nil)
    review.valid?
    expect(review.errors[:purpose]).to include("を入力してください")
  end

  # 状態がなければ無効な状態であること
  it "is invalid without a review_status" do
    review = FactoryBot.build(:review, review_status: nil)
    review.valid?
    expect(review.errors[:review_status]).to include("を入力してください")
  end
end
