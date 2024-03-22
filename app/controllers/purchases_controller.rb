class PurchasesController < ApplicationController
  def show
    @purchase = Purchase.find(params[:id])
    authorize @purchase
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "purchases/purchase_info", locals: { purchase: @purchase }, formats: [:html] }
    end
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
