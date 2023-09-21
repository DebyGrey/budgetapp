class Group < ApplicationRecord
  # Attributes
  attribute :name, :string
  attribute :icon, :string

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :entities, join_table: 'entities_groups'

  # Validations
  validates :name, presence: true
end
