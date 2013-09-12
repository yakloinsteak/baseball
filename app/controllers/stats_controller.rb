class StatsController < ApplicationController
  def index
    @stats = Stat.search(params).decorate
  end
end
