require 'rails_helper'

RSpec.feature "UserSessions", type: :feature do
  describe "ログインページ" do
    before do
      visit login_path
    end
    it "ログインページが表示されること" do
      expect(page).to have_content("Login")
    end
  end

  describe "ログイン" do
    let!(:user) { create(:user, email: "dummy@example.com", password: "dummy_pw", password_confirmation: "dummy_pw") }
    before do
      visit login_path
      fill_in "email", with: "dummy@example.com"
      fill_in "password", with: "dummy_pw"
      click_on "login"
    end
    it "ログインし、ページ遷移すること" do
      expect(page).to have_content("ログインしました")
    end
  end
end
