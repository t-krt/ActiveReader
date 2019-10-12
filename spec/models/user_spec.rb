require 'rails_helper'

RSpec.describe User, type: :model do
  # ニックネーム、メール、パスワードがあれば有効な状態であること
  it "is valid with a nickname, email and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  # ニックネームがなければ無効な状態であること
  it "is invalid without a nickname" do
    user = FactoryBot.build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end

  # メールがなければ無効な状態であること
  it "is invalid without a email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  # パスワードがなければ無効な状態であること
  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  # 重複したニックネームなら無効な状態であること
  it "is invalid with a duplicate nickname" do
    FactoryBot.create(:user, nickname: "test-user")
    user = FactoryBot.build(:user, nickname: "test-user")
    user.valid?
    expect(user.errors[:nickname]).to include("はすでに存在します")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email" do
    FactoryBot.create(:user, email: "test-user@example.com")
    user = FactoryBot.build(:user, email: "test-user@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
