class PurchasesController < ApplicationController
  #create a new purchase
  def new
    @purchase = Purchase.new
    authorize @purchase
  end

  def create
    @purchase = Purchase.new(purchase_params)
    raise
    if @purchase.save
      redirect_to dashboard_path
    else
      render :new status: :unprocessable_entity
    end
  end



  private

  def purchase_params
    params.require(:purchase).permit(:quantity)
  end
end
