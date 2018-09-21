class Pantry < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient

  validates :ingredient_id, presence: true
  validates :user_id, presence: true
  validates :remark, length: { maximum: 15 }
end
