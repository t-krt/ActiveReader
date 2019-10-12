require 'rails_helper'

RSpec.describe Task, type: :model do
  # 内容、task_idがあれば有効であること
  it "is valid with a content and task_id" do
    expect(FactoryBot.build(:task)).to be_valid
  end

  # 内容がなければ無効な状態であること
  it "is invalid without a content" do
    task = FactoryBot.build(:task, content: nil)
    task.valid?
    expect(task.errors[:content]).to include("を入力してください")
  end

end
