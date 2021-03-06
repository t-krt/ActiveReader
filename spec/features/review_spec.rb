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
    first(:link, "本を登録する").click
    expect(current_path).to eq search_books_path
    fill_in 'title', with: "Ruby on Rails"
    find('input[name="commit"]').click

    # レビューの投稿
    expect do
      first('.link-to-review').click
      expect(current_path).to eq new_review_path
      find("option[value='reading']").select_option
      fill_in 'review_deadline', with: 20200101
      fill_in 'review_purpose', with: "レビューのテスト"
      fill_in 'review_learned', with: "レビューのテスト"
      fill_in 'review_note', with: "レビューのテスト"
      find('#rating-star', visible: false).set(5)
      find('input[type="submit"]').click
    end.to change(Review, :count).by(1)
  end

  scenario 'search review with book-title' do
    sign_in_as(user)
    first(:link, "みんなの投稿").click

    # 一覧に"Ruby", "JavaScript"を含む書籍があることを確認
    expect(page).to have_content "Ruby"
    expect(page).to have_content "JavaScript"

    # 書籍名で"Ruby"を検索
    fill_in 'q[book_title_cont]', with: "Ruby"
    first(:css, 'input[name="commit"]').click

    # "Ruby"を含む書籍のみ存在し、"JavaScript"を含む書籍が無いことを確認
    expect(page).to have_content "Ruby"
    expect(page).to have_no_content "JavaScript"
  end
end
