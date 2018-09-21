class Storage < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :food_id, presence: true
  validates :user_id, presence: true
  validates :remark, length: { maximum: 15 }
end
