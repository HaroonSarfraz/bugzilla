class BugPolicy < ApplicationPolicy
 # before_action :authenticate_user!
  attr_reader :user, :bug
  def initialize(user, bug )
    @user = user
    @bug = bug
  end
def create?
    !user.nil?
  end
 def update?
    @user.admin? or @bug.creater.id == @user.id or @bug.asigned.id == @user.id
  end
  def destroy?
    @user.admin? or @bug.creater == @user or @bug.asigned == @user
  end
 class Scope < Scope
    def resolve
      scope
    end
  end
end
