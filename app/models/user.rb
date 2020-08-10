class User < ApplicationRecord
  has_many :projects
  before_save {self.email = email.downcase}

  validates :username, presence: true, length: {maximum: 15}
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: /\A[\w+\-_.]+@[a-z\d\-_.]+\.[a-z]+\z/i}
  validates :password, length: {minimum: 8}
  has_secure_password

  # def confirm_name
  #   if @user.username >= 16 
  #     flash.now[:alert] =  'ユーザー名は15文字以内で入力してください'
  #   end
  # end
end
