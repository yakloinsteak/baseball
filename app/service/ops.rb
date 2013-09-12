class OPS
  extend Forwardable
  def_delegators :@player, :hits, :doubles, :triples, :home_runs, :at_bats, :walks, :hit_by_pitch, :sacrifice_flies

  def self.for player
    new(player).value
  end

  def initialize(player)
    @player = player
  end

  def total_bases
    hits + 2 * doubles + 3 * triples + 4 * home_runs
  end

  def value
    _numerator.to_f / _denominator
  rescue NoMethodError
    return nil
  end

  private

  def _numerator
    at_bats * (hits + walks + hit_by_pitch) +
    total_bases * _magic_sum
  end

  def _denominator
    at_bats * _magic_sum
  end

  #TDB
  # FIXME: what would you call this?
  def _magic_sum
    at_bats + walks + sacrifice_flies + hit_by_pitch
  end
end
