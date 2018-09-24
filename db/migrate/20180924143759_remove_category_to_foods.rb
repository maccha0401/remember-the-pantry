class RemoveCategoryToFoods < ActiveRecord::Migration[5.1]
  def change
    remove_column :foods, :category, :string
  end
end
