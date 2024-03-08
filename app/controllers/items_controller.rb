class ItemsController < ApplicationController
  def index
    @items = Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

private

  def item_params
    params.require(:item).permit(:name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, :search)
  end

end
