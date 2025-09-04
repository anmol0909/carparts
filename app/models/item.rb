class Item < ApplicationRecord
  acts_as_paranoid

  has_many :orders
  has_many :members, through: :orders

  STATUSES = %w[tracked available unavailable]

  scope :tracked, -> { where(status: "tracked") }
  scope :available, -> { where(status: "available") }
  scope :unavailable, -> { where(status: "unavailable") }

  validates :name, presence: true, length: { maximum: 150 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: STATUSES }
end
