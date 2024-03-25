class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index

    # all items that are not equal to the current user
    @items = policy_scope(Item).where.not(user: current_user)
    @user = current_user
    #transform user to array

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
    authorize @item
    @items = Item.all
    @item_array = Item.where(id: @item.id)
    @user = current_user

    @markers = [{
                  label: "object",
                  lat: @item.latitude,
                  lng: @item.longitude,
                  info_window_html: render_to_string(partial: "info_window", locals: {item: @item}),
                  marker_html: render_to_string(partial: "marker", locals: {item: @item})
                },
                {
                  label: "user",
                  lat: @user.latitude,
                  lng: @user.longitude,
                  marker_html: render_to_string(partial: "marker", locals: {item: current_user})

                }]

    @distance = Geocoder::Calculations.distance_between([@user.latitude, @user.longitude], [@item.latitude, @item.longitude], units: :km)

    @emissions = {
      "Walking / Bicycle / Electric Vehicle" => 0 * @distance,
      "Motorcycle" => 100 * @distance,
      "Car" => 200 * @distance,
      "Small Van" => 400 * @distance,
      "Medium Truck" => 750 * @distance,
      "Large Truck" => 2000 * @distance,
      "Maritime Transportation" => 4000 * @distance,
      "Air Transportation" => 12500 * @distance
    }

  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
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

  def edit
    authorize @item
  end

  def update
    @item.user = current_user
    authorize @item
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :location, :quantity, :price, :condition, :description, :co2_emitions, :start_date, :end_date, images: [])
  end


end
