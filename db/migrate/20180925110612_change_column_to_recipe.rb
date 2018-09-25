class ChangeColumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    change_column :recipes, :name, :string, null: false
    change_column :recipes, :created_user_id, :integer, null: false
    change_column :recipes, :category, :string, null: false
  end
end
