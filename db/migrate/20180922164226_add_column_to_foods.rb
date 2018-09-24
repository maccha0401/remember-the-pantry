class AddColumnToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :category, :string
    add_column :foods, :hiragana, :string
    add_column :foods, :katakana, :string
    add_column :foods, :kanji, :string
  end
end
