class Invoice < ApplicationRecord
  belongs_to :user

  validates :number, :amount, presence: true
end
