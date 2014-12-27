module ApplicationHelper
  def pagination_links(collection, options = {})
    options[:renderer] ||= "BootstrapPagination::Rails"
    options[:class] ||= 'pagination-centered no-margin-bottom'
    options[:inner_window] ||= 2
    options[:outer_window] ||= 1
    options[:next_label] ||= "Следующая"
    options[:previous_label] ||= "Предыдущая"
    will_paginate(collection, options)
  end

  def flash_class(level)
    case level
      when "notice" then "alert alert-info"
      when "success" then "alert alert-success"
      when "error" then "alert alert-danger"
      when "alert" then "alert alert-warning"
      else "alert #{level}"
    end
  end

end
