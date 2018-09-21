class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
