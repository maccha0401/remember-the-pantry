class RenameNameJaColumnToFoodCategories < ActiveRecord::Migration[5.1]
  def change
    rename_column :food_categories, :name_ja, :name
  end
end
