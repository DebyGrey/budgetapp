# spec/models/entity_spec.rb

require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:group) { Group.create(name: 'Group', icon: 'icon', author: user) }
  let(:entity) { Entity.new(name: 'Entity Name', amount: 100, author: user) }

  it 'is valid' do
    entity.groups << group
    expect(entity).to be_valid
  end

  it 'has a name' do
    entity.name = ''
    expect(entity).not_to be_valid
  end

  it 'has a valid amount' do
    entity.amount = nil
    expect(entity).not_to be_valid
  end

  it 'has an author associated' do
    entity.author = nil
    expect(entity).not_to be_valid
  end

  it 'associated author is valid' do
    expect(entity.author).to be_valid
  end
end
