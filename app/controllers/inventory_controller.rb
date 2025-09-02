class InventoryController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.limit(10)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to inventory_index_path, notice: "Item updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to inventory_index_path, notice: "Item deleted successfully."
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :status, :quantity, :price)
  end
end