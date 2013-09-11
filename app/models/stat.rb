#Translation:
#ops = (at_bats * (hits + walks + hit_by_pitch) + total_bases * (at_bats + walks + sacrifice_flies + hit_by_pitch)) / (at_bats * (at_bats + walks + sacrifice_flies + hit_by_pitch))

# http:/en.wikipedia.org/wiki/Total_bases/
#  i.e., the sum of his hits weighted by 1 for a single, 2 for a double, 3 for a triple and 4 for a home run. Only bases attained from hits count toward this
# total_bases = hits + 2 * doubles + 3 * triples + 4 * home_runs

class Stat < ActiveRecord::Base
  belongs_to :player

  before_save :write_batting_average

  def batting_average=
    raise NotImplementedError.new('This is a computed and cached value.')
  end

  private

  def write_batting_average
    write_attribute(:batting_average, computed_batting_average)
  end

  def computed_batting_average
    if at_bats.to_i == 0
      0.0
    else
      hits.to_f / at_bats
    end
  end
end
