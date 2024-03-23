class ItemOwnerMailer < ApplicationMailer
  def purchase_proposal_notification(owner_email, purchase)
    @owner_email = owner_email
    @purchase = purchase
    mail(to: owner_email, subject: 'New Purchase Proposal')
  end
end
