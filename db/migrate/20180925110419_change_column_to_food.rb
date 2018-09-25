class ChangeColumnToFood < ActiveRecord::Migration[5.1]
  def change
    change_column :foods, :name, :string, null: false
    change_column :foods, :category_id, :integer, null: false
  end
end
