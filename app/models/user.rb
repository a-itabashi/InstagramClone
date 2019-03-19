class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:10}
  validates :email, presence: true, length: {maximum:20},
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true
  before_validation {email.downcase!}
  has_secure_password
  validates :password, presence: true, length: {minimum: 5}

  has_many :posts

  mount_uploader :user_image, ImageUploader
end
