module ApplicationHelper
  def current_user_role
    if current_user.admin? 
      return 'Administrador'
    elsif current_user.assistant? 
      return 'Asistente'
    else current_user.professional? 
      return 'Profesional'
    end
  end
end
