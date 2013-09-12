class StatsController < ApplicationController
  def index
    params[:year] ||= 1998
    params[:order_by] ||= 'batting_average desc'

    @stats = Rails.cache.fetch(params.inspect) do
      Stat.search(params).decorate.to_a
    end

    if request.xhr?
      render 'index', layout: false
    end
  end
end
