module StatsHelper
  def stats_link_to name, order_by

    Rails.logger.error params[:order_by]

    if params[:order_by].nil?
      new_order_by = order_by
    elsif params[:order_by].ends_with? 'asc'
      new_order_by = params[:order_by].sub(/asc/, 'desc')
    else
      new_order_by = params[:order_by].sub(/desc/, 'asc')
    end

    link_to name, stats_path(format: :html, order_by: new_order_by), remote: true
  end
end
