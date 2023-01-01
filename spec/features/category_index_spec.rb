require 'rails_helper'

RSpec.feature 'Category Index Page', type: :feature, js: true do
  include Devise::Test::IntegrationHelpers

  let!(:user) { User.create(email: 'test@example.com', password: 'password') }

  before(:each) do
    login_as(user, scope: :user)
    visit categories_path
  end

  scenario 'Visiting the index path' do
    expect(page).to have_content('Categories')
  end

  scenario 'allows creating new category' do
    click_link('New Category')
    expect(page).to have_current_path(new_category_path)
  end
end
