require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  let(:user) { create(:user) }

  scenario 'post review' do
    # ログイン前には"本を登録する"ボタンがない
    visit root_path
    expect(page).to have_no_content('本を登録する')
  end
end
