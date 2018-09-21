class Recipe < ApplicationRecord
  belongs_to :created_user, class_name: "User"
  has_many :cooking_ingredients, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }
  validates :created_user_id, presence: true
end
