class Food < ApplicationRecord
  has_many :pantries

  validates :name, presence: true, length: { maximum: 20 }
end
