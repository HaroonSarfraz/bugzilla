module ApplicationHelper
  def admin?
    if !user_signed_in?
      return false
    elsif current_user.admin.nil?
      return false
    else
      return current_user.admin
    end
  end
  def canchange?(project)
     admin? or current_user.projects.include? project
  end
end
