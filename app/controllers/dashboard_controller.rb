class DashboardController < ApplicationController

  def index
    @tracked_count     = Item.tracked.count
    @available_count   = Item.available.count
    @unavailable_count = Item.unavailable.count
    @orders            = Order.all.order(created_at: :desc)
    @expired_orders    = Order.expired.count
    @members           = Member.all.order(created_at: :desc)
  end
end
