class Food < ApplicationRecord
  has_many :storages
  belongs_to :food_category, class_name: "FoodCategory", foreign_key: "category_id"

  validates :name, presence: true, length: { maximum: 20 }
end
