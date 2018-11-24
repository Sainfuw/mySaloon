class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.admin?
      can :manage, :all
    elsif user.assistant?
      can [:manage], Customer
      can [:manage], Service
      can [:manage], Booking
    elsif user.professional?
      can [:read, :update], Booking, user: user
      can [:create], Booking
      can [:create, :read], Service
    end
  end
end
