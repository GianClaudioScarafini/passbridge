class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(purchase_params)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:quantity, :other_attributes)
  end
end
