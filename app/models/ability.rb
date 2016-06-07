class Ability
  include CanCan::Ability

  # TODO verificar permissoes de cada tipo de usuario
  def initialize(user)
    alias_action :delete, to: :destroy
    alias_action :edit, to: :update
    alias_action :new, to: :create
    alias_action :new_action, to: :create
    alias_action :show, to: :read
    alias_action :index, :read, to: :display
    alias_action :create, :update, :destroy, to: :modify

    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.customer?
      can :display, Order
      can :display, Payment
    else
      can :manage, Customer
      can :manage, Order
      can :manage, Payment
    end

    can :index, :home
  end
end
