class Item < ApplicationRecord
  has_many :orders
  has_many :members, through: :orders

  STATUSES = %w[tracked available unavailable expired]

  scope :tracked, -> { where(status: "tracked") }
  scope :available, -> { where(status: "available") }
  scope :unavailable, -> { where(status: "unavailable") }
  scope :expired, -> { where(status: "expired") }
end