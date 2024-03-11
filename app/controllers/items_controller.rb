class ItemsController < ApplicationController
  def index
<<<<<<< HEAD
    if params[:search]
      @items = Item.where("name LIKE ?", "%#{params[:search]}%")
    else
      @Items = Item.all
    end
=======
    @items = Item.all

    @markers = @items.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
>>>>>>> 2697ebdca69c102488a851592a784bee5d036b07
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

<<<<<<< HEAD
private
=======
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private
>>>>>>> 2697ebdca69c102488a851592a784bee5d036b07

  def item_params
    params.require(:item).permit(:name, :location, :description, :price, :condition, :quantity, :start_date, :end_date, :search)
  end
end
