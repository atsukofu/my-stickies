class User < ApplicationRecord
  has_many :projects
  before_save {self.email = email.downcase}

  validates :username, presence: true, length: {maximum: 15}
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, length: {minimum: 8}
  has_secure_password
end
