class Invoice < ApplicationRecord
  belongs_to :user

  validates :number, :amount, presence: true

  enum :status, [:pending, :paid, :overdue]

  def client_name
    user.email.split('@').first.capitalize
  end
end
