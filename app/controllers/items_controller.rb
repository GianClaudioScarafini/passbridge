class ItemsController < ApplicationController
  def index
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if params[:item][:images].nil?
      @item.update(item_params_no_imgs)
    else
      @item.update(item_params)
    end
    redirect_to item_path(@item)
  end


  private

  def item_params
    params.require(:item).permit(:name, :location, :quantity, :price, :condition, :description, :co2_emitions, images: [])
  end

  def item_params_no_imgs
    params.require(:item).permit(:name, :location, :quantity, :price, :condition, :description, :co2_emitions)
  end
end
