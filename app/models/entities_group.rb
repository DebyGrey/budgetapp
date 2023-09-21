class EntitiesGroup < ApplicationRecord
  # Associations
  belongs_to :entity
  belongs_to :group
end
