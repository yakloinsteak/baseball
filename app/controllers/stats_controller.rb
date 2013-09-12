class StatsController < ApplicationController
  def index
    @stats = Stat.search(params).decorate

    if request.xhr?
      render 'index', layout: false
    end
  end
end
