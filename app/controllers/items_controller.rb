class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end
end
