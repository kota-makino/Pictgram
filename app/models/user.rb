class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password,presence: true

  has_secure_password

  has_many :topics

  validates :password, length: { in: 8..32 }
  validates :password_confirmation, length: { in: 8..32 }

  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/ }

  validates :email, format: { with: /\A\A[\w+\-.]+@[a-z\d|\-.]+\.[a-z]+\z/i }

  validates :name, length: { maximum: 15 }
end
