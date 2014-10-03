module PermissionHelper
<<<<<<< HEAD
  def user_has_permision_to_change?(view)
    if !current_user.nil? && current_user == view.user || !current_user.nil? && current_user.admin?
      true
    else
      false
    end
=======
  def user_has_permision_to_change?(model)
    current_user && (current_user == model.user || current_user.admin?)
>>>>>>> 347273deded43b713c0035c354fd8b7745f10ea7
  end
end
