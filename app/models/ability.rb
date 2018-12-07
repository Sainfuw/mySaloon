class Ability
  include CanCan::Ability
  def initialize(user)
    can [:read], User, id: user.id
    return unless user.professional? or user.assistant? or user.admin?
    can [:read, :update], Booking, user: user
    can [:create], Booking
    can [:create, :read], Service
    can [:create], Billing
    can [:read], Customer
    return unless user.assistant? or user.admin?
    can [:manage], Customer
    can [:create, :read], Service
    can [:manage], Booking
    can [:create, :read, :update], Billing
    return unless user.admin?
    can :manage, :all
  end
end
