class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(purchase_params)
  end

  def confirm_purchase
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.item = @item
    @purchase.user = current_user

    if @purchase.save
      ItemOwnerMailer.purchase_proposal_notification(@item.owner_email, @purchase).deliver_now
      redirect_to root_path, notice: 'Purchase confirmed successfully.'
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:quantity, :shipping_method)
  end
end
