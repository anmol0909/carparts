class Member < ApplicationRecord
  acts_as_paranoid

  has_many :orders
  has_many :items, through: :orders

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
end