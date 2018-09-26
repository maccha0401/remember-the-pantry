ActiveAdmin.register Food do
  permit_params :name, :hiragana, :katakana, :kanji, :other, :category_id
end
