class PurchaseProposalsController < ApplicationController
    before_action :set_purchase_proposal, only: [:show, :edit, :update, :destroy]

    def index
      @purchase_proposals = PurchaseProposal.all
    end

    def show
    end

    def new
      @purchase_proposal = PurchaseProposal.new
    end

    def edit
    end

    def create
      @purchase_proposal = PurchaseProposal.new(purchase_proposal_params)

      if @purchase_proposal.save
        redirect_to @purchase_proposal, notice: 'Purchase proposal was successfully created.'
      else
        render :new
      end
    end

    def update
      if @purchase_proposal.update(purchase_proposal_params)
        redirect_to @purchase_proposal, notice: 'Purchase proposal was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @purchase_proposal.destroy
      redirect_to purchase_proposals_url, notice: 'Purchase proposal was successfully deleted.'
    end

    private
      def set_purchase_proposal
        @purchase_proposal = PurchaseProposal.find(params[:id])
      end
⁄
      def purchase_proposal_params
        params.require(:purchase_proposal).permit(:title, :description, :price)
      end
  end


end
