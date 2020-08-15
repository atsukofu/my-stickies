require 'rails_helper'

feature 'session', type: :feature do
  let(:user) {FactoryBot.create(:user)}

  scenario "user login-logout-test" do
    visit new_session_path
    fill_in 'session-email', with: user.email
    fill_in 'session-password', with: user.password
    click_button "サインイン"
    expect(current_path).to eq root_path

    click_on("ログアウト")
    expect(current_path).to eq new_session_path
    expect(page).to have_content('ログアウトしました')
  end

end