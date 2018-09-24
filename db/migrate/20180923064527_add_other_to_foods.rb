class AddOtherToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :other, :string
  end
end
