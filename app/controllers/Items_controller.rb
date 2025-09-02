class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: "Item created successfully."
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "Item updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Item deleted successfully."
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :status)
  end
end
