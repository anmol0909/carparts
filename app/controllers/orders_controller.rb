class OrdersController < ApplicationController
  def index
    orders = Order.includes(:item, :member).all
    render json: orders.map { |order|
      {
        description: order.item.name,
        quantity: order.quantity,
        return_by: order.return_by,
        borrowed_by: order.member.name
      }
    }
  end
end

