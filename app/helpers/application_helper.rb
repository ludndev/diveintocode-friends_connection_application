module ApplicationHelper

  def active_nav(path)
    if current_page?(path)
      'active'
    end
  end

end
