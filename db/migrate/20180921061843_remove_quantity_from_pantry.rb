class RemoveQuantityFromPantry < ActiveRecord::Migration[5.1]
  def change
    remove_column :pantries, :quantity, :integer
  end
end
