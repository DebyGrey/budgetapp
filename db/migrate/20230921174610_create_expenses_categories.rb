class CreateExpensesCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses_categories do |t|
      t.references :expense, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
