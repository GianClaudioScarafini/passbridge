class ItemsController < ApplicationController
  def index
<<<<<<< HEAD
    @items = Item.search(params[:search])
=======
    @items = Item.all
>>>>>>> 969ea09bcb0f718f42df242a21606e0c72ec7ce4
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

<<<<<<< HEAD
private

  def item_params
    params.require(:item).permit(:name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, :search)
  end

=======
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
  end

  private

  def item_params
    params.require(:item).permit(:name, :location, :quantity, :price, :condition, :description, :co2_emitions, images: [])
  end
>>>>>>> 969ea09bcb0f718f42df242a21606e0c72ec7ce4
end
