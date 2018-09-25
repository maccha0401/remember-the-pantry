class ChangeColumnToStorage < ActiveRecord::Migration[5.1]
  def change
    change_column :storages, :food_id, :integer, null: false
    change_column :storages, :user_id, :integer, null: false
  end
end
