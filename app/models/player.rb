class Player < ActiveRecord::Base
  has_many :contracts
  has_many :teams, through: :contracts
  has_many :stats

  def stats_for_year year
    stats.where(year: year).first
  end
end
