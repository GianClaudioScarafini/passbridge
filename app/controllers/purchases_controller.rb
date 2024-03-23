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

  def purchase_params
    params.require(:purchase).permit(:status)
  end
end
