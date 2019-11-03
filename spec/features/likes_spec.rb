require 'rails_helper'

RSpec.feature "likes", type: :feature do
  given(:user) { FactoryBot.create(:sample_user) }
  given(:review) { FactoryBot.create(:review) }

  feature "If user haven't already liked" do
    scenario "User can like" do
      sign_in_as(user)
      first(:link, "みんなの投稿").click

      expect do
        first(".likable").click
      end.to change(Like, :count).by(1)
      expect(page).to have_selector '.like-count', text: '1'
      expect(page).to have_css ".liked"
    end
  end

  feature "「If user haven already liked" do
    scenario "User can unlike" do
      sign_in_as(user)
      first(:link, "みんなの投稿").click

      expect do
        first(".likable").click
      end.to change(Like, :count).by(1)

      expect do
        first(".liked").click
      end.to change(Like, :count).by(-1)
      expect(page).to have_selector '.like-count', text: '0'
    end
  end
end
