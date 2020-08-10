require 'rails_helper'

feature "SignUps", type: :feature do
  include ActiveJob::TestHelper

  scenario "user successfully signs up" do
    visit new_user_path
    perform_enqueued_jobs do
      expect {
        fill_in "username-box", with: "username"
        fill_in "newemail-box", with: "test@example.com"
        fill_in "newpassword-box", with: "testtest"
        fill_in "newpassword-confirm", with: "testtest"
        click_button "登録"
      }.to change(User, :count).by(1)

      expect(current_path).to eq root_path
    end
  end
end

