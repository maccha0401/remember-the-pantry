class AddCategoryIdToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :category_id, :integer, after: :name
  end
end
