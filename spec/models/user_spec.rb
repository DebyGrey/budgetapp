# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a name' do
      user = User.new(name: 'John Doe')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe 'Associations' do
    it 'has many entities' do
      association = described_class.reflect_on_association(:entities)
      expect(association.macro).to eq :has_many
    end

    it 'has many groups' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq :has_many
    end
  end
end
