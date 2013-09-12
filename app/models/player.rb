class Player < ActiveRecord::Base
  has_many :contracts
  has_many :teams, through: :contracts
  has_many :stats

  #TDB
  def team
    teams.first
  end
end
