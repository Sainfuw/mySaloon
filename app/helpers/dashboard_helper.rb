module DashboardHelper
  def set_color(index)
    case index
    when 0
      return 'bg-primary'
    when 1
      return 'bg-secondary'
    when 2
      return 'bg-cyan'
    when 3
      return 'bg-danger'
    end
  end
end
