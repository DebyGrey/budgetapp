class ExpensesCategory < ApplicationRecord
  # Associations
  belongs_to :expense
  belongs_to :category
end
