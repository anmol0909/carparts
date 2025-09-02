class Order < ApplicationRecord
  belongs_to :item
  belongs_to :member

  enum status: { borrowed: "borrowed", returned: "returned", expired: "expired" }
end