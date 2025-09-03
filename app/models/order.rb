class Order < ApplicationRecord
  belongs_to :item
  belongs_to :member

  STATUSES = %w[borrowed returned expired]

  scope :borrowed, -> { where(status: "borrowed") }
  scope :returned, -> { where(status: "returned") }
  scope :expired,  -> { where(status: "expired") }
end
