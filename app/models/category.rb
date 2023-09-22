class Category < ApplicationRecord
  # Attributes
  attribute :name, :string
  attribute :icon, :string

  # Associations
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :expenses, join_table: :expenses_categories

  # Validations
  validates :name, presence: true

  # Methods
  def total_expenditure
    expenses.sum(:amount)
  end
end
