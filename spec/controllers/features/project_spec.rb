require 'rails_helper'

feature 'project', type: :feature do
  let(:user) {create(:user)}
  scenario 'ログインするとroot_pathへ遷移すること' do
    visit new_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    find('input[name="commit').click
    expect(current_path).to eq root_path
  end
end