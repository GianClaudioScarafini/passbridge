class PurchasesController < ApplicationController
  #create a new purchase
  def new
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
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
    params.require(:purchase).permit(:quantity, :shipping_method_id, :distance, :total_co2_emitions, :price)
  end
end
