class ChangeColumnToFoodCategory < ActiveRecord::Migration[5.1]
  def change
    change_column :food_categories, :name_en, :string, null: false
    change_column :food_categories, :name_ja, :string, null: false
  end
end
