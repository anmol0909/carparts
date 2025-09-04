class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy, :show]

  def index
    @orders = Order.includes(:item, :member).order(created_at: :desc)
  end

  def show
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order deleted successfully."
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :email, :phone_number)
  end
end

