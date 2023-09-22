require 'rails_helper'

RSpec.feature 'expenses/show', type: :feature do
  include Devise::Test::IntegrationHelpers

  let!(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'backarrow.png', user:) }
  let(:expense) { Expense.new(name: 'Test Expenditures', amount: 100) }

  before(:each) do
    expense.author = user
    expense.categories << category
    expense.save
    login_as(user, scope: :user)
    visit category_expense_path(category, expense)
  end

  scenario 'renders attributes in <p>' do
    expect(page).to have_content('Expenditure')
  end

  scenario 'navigates back to category page' do
    click_on 'Back'
    expect(page).to have_current_path(category_path(category))
  end

  scenario 'allows signing out' do
    click_on 'Sign Out'
    expect(page).to have_content('Budget')
  end
end
