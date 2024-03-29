class PurchasesController < ApplicationController
  def index
    @purchases = policy_scope(Purchase)
    @purchases = @purchases.where(item_id: params[:item_id])
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "purchases/purchase_info", locals: { purchases: @purchases }, formats: [:html] }
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    authorize @purchase
  end

  def update
    @purchase = Purchase.find(params[:id])
    authorize @purchase
    @purchase.update(purchase_params)
    redirect_to dashboard_path
  end

  def new
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    @shipping_methods = ShippingMethod.select(:id, :method, :co2_ratio).to_json
    authorize @purchase
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.item = @item
    @purchase.user = current_user
    authorize @purchase
    if @purchase.quantity > @item.quantity
      flash[:alert] = "You can't buy more than the available quantity"
      render :new, status: :unprocessable_entity
    else
      if @purchase.save
        redirect_to dashboard_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:quantity, :shipping_method_id, :distance, :total_co2_emitions, :price, :status)
  end
end
