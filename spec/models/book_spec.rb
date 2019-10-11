require 'rails_helper'

RSpec.describe Book, type: :model do
  # タイトル、著者があれば有効な状態であること
  it "is valid with a title and author"
  
  # タイトルがなければ無効な状態であること
  it "is invalid without a title"

  # 著者がなければ無効な状態であること
  it "is invalid without a title"
end
