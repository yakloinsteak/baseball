module StatsHelper
  #TDB
  def stats_link_to name, order_by
    extra = ''
    if order_by == params[:order_by]
      new_order_by = order_by.sub(/desc/, 'asc')
    else
      new_order_by = order_by
    end

    if order_by.sub(/desc|asc/, '') == params[:order_by].sub(/desc|asc/, '')
      if new_order_by =~ /asc/
        extra = "&darr;".html_safe
      else
        extra = "&uarr;".html_safe
      end
    end

    link_to(name.html_safe+extra, stats_path(format: :html, order_by: new_order_by), remote: true)
  end
end
