class Entity < ApplicationRecord
  # Attributes
  attribute :name, :string
  attribute :amount, :integer

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups, join_table: 'entities_groups'

  # Validations
  validates :name, presence: true
  validates :amount, presence: true
end
