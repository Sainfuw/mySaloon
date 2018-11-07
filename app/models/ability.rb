class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.assistant?
      can [:read, :edit, :update], :all 
    elsif user.professional?
      can :read, :all
    else
      # no puede hacer nada
    end
  end
end
