class ItemsController < ApplicationController
  before_action :set_item, only: %i[show create destroy]

  def index
    @items = policy_scope(Item).all

    @markers = @items.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    authorize @item
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
    authorize @item
  end

  def create
    @item.user = current_user
    authorize @item
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @item
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :location, :quantity, :price, :condition, :description, :co2_emitions, :start_date, :end_date, images: [])
  end
end
