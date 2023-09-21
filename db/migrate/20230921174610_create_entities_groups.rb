class CreateEntitiesGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :entities_groups do |t|
      t.references :entity, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
