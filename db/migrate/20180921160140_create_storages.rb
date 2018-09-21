class CreateStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :storages do |t|
      t.integer :food_id
      t.integer :user_id
      t.string :remark

      t.timestamps
    end
  end
end
