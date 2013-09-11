class StatsController < ApplicationController
  def index
    @players = Player.first(25)
  end
end
