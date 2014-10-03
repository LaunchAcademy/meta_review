module PermissionHelper
  def user_has_permision_to_change?(model)
    if !current_user.nil? && current_user == model.user || !current_user.nil? && current_user.admin?
      true
    else
      false
    end
  end
end
