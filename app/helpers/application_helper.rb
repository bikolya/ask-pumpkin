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
end
