class ItemsController < ApplicationController
  def index
    @items = Item.all
    @user = current_user
    #traform user to array

    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {item: item}),
        marker_html: render_to_string(partial: "marker", locals: {item: item})
      }
    end

    @user_coordinates = { lat: @user.latitude,
                          lng: @user.longitude ,
                          marker_html: render_to_string(partial: "marker", locals: {item: current_user}) }

    @markers << @user_coordinates


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
