module PermissionHelper
  def user_has_permision_to_change?(view)
    if current_user == view.user || current_user.admin?
      true
    else
      false
    end
  end
end
