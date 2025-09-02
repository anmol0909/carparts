class DashboardController < ApplicationController
  def index
    @items = Item.all
    render json: @items.as_json(only: [:id, :name, :quantity, :status])
  end

  def counts
    render json: {
      tracked: Item.tracked.count,
      available: Item.available.count,
      unavailable: Item.unavailable.count,
      expired: Item.expired.count
    }
  end
end

