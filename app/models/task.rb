class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, length: {maximum: 30}
  validates :status, presence: true
  validates :project_id, presence: true
end
