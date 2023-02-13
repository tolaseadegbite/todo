class List < ApplicationRecord
  validates :description, presence: true
  belongs_to :user

  default_scope -> { order(created_at: :asc) }
end
