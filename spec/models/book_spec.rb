require 'rails_helper'

RSpec.describe Book, type: :model do
  # タイトル、著者があれば有効な状態であること
  it "is valid with a title and author" do
    expect(FactoryBot.build(:book)).to be_valid
  end

  # タイトルがなければ無効な状態であること
  it "is invalid without a title" do
    book = FactoryBot.build(:book, title: nil)
    book.valid?
    expect(book.errors[:title]).to include("を入力してください")
  end

  # 著者がなければ無効な状態であること
  it "is invalid without a author" do
    book = FactoryBot.build(:book, author: nil)
    book.valid?
    expect(book.errors[:author]).to include("を入力してください")
  end
end
