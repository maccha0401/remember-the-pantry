class Ingredient < ApplicationRecord
  has_many :pantries
  validates :name, presence: true, length: { maximum: 50 }
end
