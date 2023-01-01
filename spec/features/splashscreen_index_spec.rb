require 'rails_helper'

RSpec.feature 'Splashscreen', type: :feature, js: true do
  scenario 'Visiting the root path' do
    visit root_path

    expect(page).to have_content('Grey Budget App')
  end

  before(:each) { visit root_path }

  scenario 'Click log in' do
    click_link('Log In')
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'Click sign up' do
    click_link('Sign Up')
    expect(page).to have_current_path(new_user_registration_path)
  end
end
