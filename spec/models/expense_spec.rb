# spec/models/expense_spec.rb

require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: '1234567890') }
  let(:category) { Category.create(name: 'Category', icon: 'icon', author: user) }
  let(:expense) { Expense.new(name: 'Entity Name', amount: 100, author: user) }

  it 'is valid' do
    expense.categories << category
    expect(expense).to be_valid
  end

  it 'has a name' do
    expense.name = ''
    expect(expense).not_to be_valid
  end

  it 'has a valid amount' do
    expense.amount = nil
    expect(expense).not_to be_valid
  end

  it 'has an author associated' do
    expense.author = nil
    expect(expense).not_to be_valid
  end

  it 'associated author is valid' do
    expect(expense.author).to be_valid
  end
end
