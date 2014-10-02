module PermissionHelper
  def user_has_permision_to_change?(model)
    if current_user.nil?
      false
    elsif  current_user == model.user || current_user.admin?
      true
    else
      false
    end
  end
end
