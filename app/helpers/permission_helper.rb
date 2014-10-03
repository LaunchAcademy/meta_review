module PermissionHelper
  def user_has_permision_to_change?(model)
    current_user && (current_user == model.user || current_user.admin?)
  end
end
