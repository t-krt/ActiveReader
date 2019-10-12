require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  let(:user) { create(:user) }

  scenario 'post review' do
    # ログイン前には"本を登録する"ボタンがない
    visit root_path
    expect(page).to have_no_content('本を登録する')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    first(:css, 'input[name="commit"]').click
    expect(current_path).to eq reading_user_path(user)
    expect(page).to have_content('本を登録する')

    # レビューする本の選択
    click_link('本を登録する')
    expect(current_path).to eq search_books_path
    fill_in 'title', with: "Ruby on Rails"
    find('input[name="commit"]').click
  end
end
