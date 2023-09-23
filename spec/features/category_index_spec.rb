require 'rails_helper'

RSpec.feature 'Category Index Page', type: :feature, js: true do
  include Devise::Test::IntegrationHelpers

  # Move the 'let' declarations here, outside of 'before(:context)'
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

  scenario 'allows creating new category' do
    within('.new-category-btn-container') do
      click_link('New Category')
    end
    expect(page).to have_current_path(new_category_path)
  end
end
