require 'rails_helper'

RSpec.feature 'Category Index Page', type: :feature, js: true do
  include Devise::Test::IntegrationHelpers

  let!(:user) { User.create(email: 'test@example.com', password: 'password') }
  let!(:category1) { Category.create(name: 'Test1 Category', icon: 'fa fa-home') }
  let!(:category2) { Category.create(name: 'Test2 Category', icon: 'fa fa-home') }

  before do
    user.categories << [category1, category2]
    login_as(user, scope: :user)
  end

  before(:each) { visit categories_path }

  scenario 'Visiting the index path' do
    expect(page).to have_content('Categories')
  end

  scenario 'allows signing out' do
    click_link('Sign Out')
    expect(page).to have_current_path(root_path)
  end
end
