class BattingAverage
  attr_reader :at_bats, :hits

  def self.for player
    new(player).value
  end

  def initialize player
    @at_bats = player.at_bats
    @hits = player.hits
  end

  def value
    if at_bats.to_i == 0
      0.0
    else
      hits.to_f / at_bats
    end
  end
end
