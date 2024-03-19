class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.user = current_user

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
