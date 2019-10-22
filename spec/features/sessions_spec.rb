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

end
