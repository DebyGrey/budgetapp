# spec/models/entity_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: '1234567890') }
  let(:category) { Category.create(name: 'Category', icon: 'icon', author: user) }
  let(:expense) { Expense.new(name: 'Entity Name', amount: 100, author: user) }

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'has a name' do
    category.name = ''
    expect(category).not_to be_valid
  end

  it 'has a user associated' do
    category.author = nil
    expect(category).not_to be_valid
  end

  it 'associated user is valid' do
    expect(category.author).to be_valid
  end
end
