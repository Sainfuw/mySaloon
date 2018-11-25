class Ability
  include CanCan::Ability
  def initialize(user)
    can [:read], User, id: user.id
    return unless user.professional? or user.assistant? or user.admin?
    can [:read, :update], Booking, user: user
    can [:create], Booking
    can [:create, :read], Service
    return unless user.assistant? or user.admin?
    can [:manage], Customer
    can [:create, :read], Service
    can [:manage], Booking
    return unless user.admin?
    can :manage, :all
  end
end
