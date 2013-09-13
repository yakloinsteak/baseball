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
    if _denominator == 0
      nil
    else
      _numerator.to_f / _denominator
    end
  rescue NoMethodError, TypeError
    return nil
  end

  private

  def _numerator
    at_bats * (hits + walks + hit_by_pitch) +
    total_bases * _potential_bases
  end

  def _denominator
    at_bats * _potential_bases
  end

  def _potential_bases
    at_bats + walks + sacrifice_flies + hit_by_pitch
  end
end
