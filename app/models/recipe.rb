class Recipe < ApplicationRecord
  belongs_to :created_user, class_name: "User", foreign_key: :created_user_id
  belongs_to :recipe_category, class_name: "RecipeCategory", foreign_key: "category_id"
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients

  validates :name, presence: true, length: { maximum: 15 }
  validates :created_user_id, presence: true

  def foods_id
    self.ingredients.map(&:food_id)
  end
end
