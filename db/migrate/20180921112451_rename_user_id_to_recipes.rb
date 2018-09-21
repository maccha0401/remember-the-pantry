class RenameUserIdToRecipes < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :user_id, :created_user_id
  end
end
