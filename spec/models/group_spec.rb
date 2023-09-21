# spec/models/entity_spec.rb

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:group) { Group.create(name: 'Group', icon: 'icon', author: user) }
  let(:entity) { Entity.new(name: 'Entity Name', amount: 100, author: user) }

  it 'is valid' do
    expect(group).to be_valid
  end

  it 'has a name' do
    group.name = ''
    expect(group).not_to be_valid
  end

  it 'has a user associated' do
    group.author = nil
    expect(group).not_to be_valid
  end

  it 'associated user is valid' do
    expect(group.author).to be_valid
  end
end
