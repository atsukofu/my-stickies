class User < ApplicationRecord
  before_save {self.email = email.downcase}

  validates :username, presence: true
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  has_secure_password
end
