class Project < ApplicationRecord
  has_many :tasks
  validates :name, presence: true
  belongs_to :user
end
