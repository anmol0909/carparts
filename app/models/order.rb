class Order < ApplicationRecord
  acts_as_paranoid

  belongs_to :item
  belongs_to :member

  STATUSES = %w[borrowed returned expired]

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :borrowed_by, presence: true, length: { maximum: 100 }
  validates :return_by, presence: true

  scope :borrowed, -> { where(status: "borrowed") }
  scope :returned, -> { where(status: "returned") }
  scope :expired,  -> { where(status: "expired") }
end
