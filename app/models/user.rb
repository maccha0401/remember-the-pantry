class User < ApplicationRecord
  has_many :pantries, dependent: :destroy
  has_many :recipes, foreign_key: "created_user_id", dependent: :destroy

  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def my_pantries
    Pantry.where("user_id = :user_id", user_id: id)
  end
end
