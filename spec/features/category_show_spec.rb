require 'rails_helper'

RSpec.feature 'Category Show Page', type: :feature do
  let!(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'backarrow.png', user:) }
  let(:purchase) { Purchase.new(name: 'Test Purchase', amount: 100, author: user) }

  before do
    purchase.categories << category
    purchase.save
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  before(:each) { visit category_path(category) }

  scenario 'displays category details and purchases' do
    expect(page).to have_content(category.name)
    expect(page).to have_content('Total:')
    expect(page).to have_content(purchase.name)
  end

  scenario 'navigates back to categories index' do
    click_on 'Back'
    expect(page).to have_current_path(categories_path)
  end

  scenario 'allows signing out' do
    click_on 'Sign Out'
    expect(page).to have_content('Budget')
  end
end
