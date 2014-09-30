module PermissionHelper
  def user_has_permision_to_change?(view)
    current_user == view.user || current_user.admin? ? true : false
  end
end
