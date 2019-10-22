require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  let(:user) { create(:user) }

  scenario "user can sign_in with user's account" do
    visit root_path
    first(:link, "ログイン").click
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    first(:css, 'input[name="commit"]').click
    expect(current_path).to eq reading_user_path(user)
    expect(page).to have_content('ログインしました。')
  end

  scenario "user can sign_out" do
    visit root_path
    first(:link, "ログイン").click
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    first(:css, 'input[name="commit"]').click
    expect(current_path).to eq reading_user_path(user)
    first(:link, "ログアウト").click
    expect(page).to have_content "ログアウトしました。"
  end

  scenario "test-user can sign_in" do
    # テストユーザーのアカウントは、seeds.rbを利用して保存済み。
    visit root_path
    first(:link, "ログイン").click
    fill_in 'user_email', with: 'guest-user@guest.com'
    fill_in 'user_password', with: 'guest123'
    first(:css, 'input[name="commit"]').click
    # "1"はテストユーザーのID
    expect(current_path).to eq reading_user_path(1)
    expect(page).to have_content('ログインしました。')
  end

  scenario "test-user can sign_out" do
    visit root_path
    first(:link, "ログイン").click
    fill_in 'user_email', with: 'guest-user@guest.com'
    fill_in 'user_password', with: 'guest123'
    first(:css, 'input[name="commit"]').click
    expect(current_path).to eq reading_user_path(1)
    first(:link, "ログアウト").click
    expect(page).to have_content "ログアウトしました。"
  end
end
