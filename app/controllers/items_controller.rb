class ItemsController < ApplicationController
  def index
    @items = Item.all

    if params[:search]
        @items = Item.where("name LIKE ?", "%#{params[:search]}%")
      else
        @Items = Item.all
    end

    @user = current_user
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
    @item_array = Item.where(id: @item.id)

    @markers = @item_array.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
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
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:name, :location, :quantity, :price, :condition, :description, :co2_emitions, :start_date, :end_date, images: [])
  end
end
