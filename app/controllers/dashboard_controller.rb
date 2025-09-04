class DashboardController < ApplicationController

  def index
    @tracked_count     = Item.tracked.count
    @available_count   = Item.available.count
    @unavailable_count = Item.unavailable.count
    @orders            = Order.order(created_at: :desc)
    @expired_orders    = Order.expired.count
    @members           = Member.order(created_at: :desc)
    
    if params[:q].present?
      query = params[:q].strip
      @members = @members.where("name ILIKE ? OR email ILIKE ? OR phone_number ILIKE ?", 
                                "%#{query}%", "%#{query}%", "%#{query}%")
      @orders = @orders.where("borrowed_by ILIKE ? OR status ILIKE ? OR description ILIKE ?", 
                              "%#{query}%", "%#{query}%", "%#{query}%")
    end
  end
end
