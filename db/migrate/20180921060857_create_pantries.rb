class CreatePantries < ActiveRecord::Migration[5.1]
  def change
    create_table :pantries do |t|
      t.integer :ingredient_id
      t.integer :quantity
      t.integer :user_id
      t.string :remark

      t.timestamps
    end
  end
end
