class ChangeColumnToIngredient < ActiveRecord::Migration[5.1]
  def change
    change_column :ingredients, :recipe_id, :integer, null: false
    change_column :ingredients, :food_id, :integer, null: false
  end
end
