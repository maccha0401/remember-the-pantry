class Food < ApplicationRecord
  has_many :storages

  validates :name, presence: true, length: { maximum: 20 }
end
