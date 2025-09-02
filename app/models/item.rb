class Item < ApplicationRecord
  has_many :orders
  has_many :members, through: :orders
end