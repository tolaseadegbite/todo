class List < ApplicationRecord
  belongs_to :user
  validates :description, presence: true, length: { maximum: 150 }

  default_scope -> { order(created_at: :asc) }
end
