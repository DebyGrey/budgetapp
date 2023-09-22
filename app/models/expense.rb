class Expense < ApplicationRecord
  # Attributes
  attribute :name, :string
  attribute :amount, :integer

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :categories, join_table: 'expenses_categories',
                                       foreign_key: 'expense_id',
                                       association_foreign_key: 'category_id'

  # Validations
  validates :name, presence: true
  validates :amount, presence: true
  validates :categories, presence: { message: 'must select at least one category' }
end
