class User < ApplicationRecord
  # Validations
  validates :name, presence: true
  # Associations
  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy
end
