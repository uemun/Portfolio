class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :time, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 24}
end
