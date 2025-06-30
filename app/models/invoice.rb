class Invoice < ApplicationRecord
  belongs_to :user

  validates :number, :amount, presence: true

  enum :status, [ :pending, :paid, :overdue ]

  scope :for_user, ->(user) { where(user_id: user.id) }

  scope :recent, -> { order(created_at: :desc).limit(5) }
end
