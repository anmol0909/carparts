class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:item, :member).all
  end
end

