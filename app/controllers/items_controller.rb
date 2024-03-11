class ItemsController < ApplicationController
  def index
    if params[:search]
      @items = Item.where("name LIKE ?", "%#{params[:search]}%")
    else
      @Items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end

    def show
      @item = Item.find(params[:id])
      @items = Item.all
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, :search)
  end
end
