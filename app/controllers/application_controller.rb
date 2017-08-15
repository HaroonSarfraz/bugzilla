 class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name , :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name , :user_type])

  end
public
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
    current_user.projects.include? project
  end
private

def user_not_authorized
  flash[:alert] = "You are not authorized to perform this action."
  redirect_to(root_path)
end


end
