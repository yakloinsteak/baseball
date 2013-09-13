module StatsHelper
  def sortable_link_to name, order_by
    extra = ''

    # Toggle sort direction if order param was for this column
    if order_by == params[:order_by]
      new_order_by = order_by.sub(/desc/, 'asc')
    else
      new_order_by = order_by
    end

    # Annotate with arrows if we've sorted this column
    if _sans_direction(order_by) == _sans_direction(params[:order_by])
      extra = new_order_by =~ /asc/ ?  "&darr;" : "&uarr;"
    end

    link_to (extra+name).html_safe, stats_path(format: :html, order_by: new_order_by), remote: true
  end

  def _sans_direction str
    str.try(:sub, /desc|asc/, '')
  end
end
