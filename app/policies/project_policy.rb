class ProjectPolicy < ApplicationPolicy
 #s before_action :authenticate_user!

  attr_reader :user, :project
  def initialize(user, project)
    @user = user
    @project = project
  end

  def update?
    @user.admin? or @user.projects.include? @project
  end
  def destroy?
    @user.admin? or @user.projects.include? @project
  end
  def create?
    @user.admin? or @user.user_type == "Manager"
  end

end
