class PurchasePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  # def index?
  #   true
  # end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  # def edit?
  #   # Only the user who created the item can edit it
  #   update?
  # end

  # def update?
  #   # Only the user who created the item can update it
  #   record.user == user
  # end

  # def destroy?
  #   # Only the user who created the item can delete it
  #   record.user == user
  # end
end
