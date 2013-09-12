class StatsController < ApplicationController
  def index
    params[:year] ||= 1998
    params[:order_by] ||= 'batting_average desc'
    @stats = Stat.search(params).decorate

    if request.xhr?
      render 'index', layout: false
    end
  end
end
