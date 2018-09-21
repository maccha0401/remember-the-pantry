class RenameIngredientIdToIngredients < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :ingredient_id, :food_id
  end
end
