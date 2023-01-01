require 'rails_helper'

RSpec.feature 'Category Show Page', type: :feature do
  let!(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'backarrow.png', author: user) }
  let(:expense) { Expense.new(name: 'Test Expense', amount: 100, author: user) }

  before do
    expense.categories << category
    expense.save
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  # Ensure the 'category' object is saved to the database with a unique ID
  before(:each) do
    category.save
  end

  scenario 'displays category details and expenses' do
    visit category_path(category)
    expect(page).to have_content(category.name)
    expect(page).to have_content('Total Expenses:')
    expect(page).to have_content(expense.name)
  end

  scenario 'allows signing out' do
    click_on 'Sign Out'
    expect(page).to have_content('Budget')
  end

  scenario 'allows creating new category' do
    within('.new-category-btn-container') do
      click_link('New Category')
    end
    expect(page).to have_current_path(new_category_path)
  end
end
