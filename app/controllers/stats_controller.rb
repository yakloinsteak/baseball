class StatsController < ApplicationController
  def index
    params[:order_by] ||= 'batting_average desc'
    @stats = Stat.search(params).decorate

    if request.xhr?
      render 'index', layout: false
    end
  end
end
