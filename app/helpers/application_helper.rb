module ApplicationHelper
  def user_role(user = current_user)
    if user.admin? 
      return 'Administrador'
    elsif user.assistant? 
      return 'Asistente'
    else user.professional? 
      return 'Profesional'
    end
  end
end
