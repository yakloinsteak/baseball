class StatDecorator < Draper::Decorator
  delegate_all
  decorates_association :player

  FORMAT = "%.4f"

  def batting_average
    _pretty_float object.batting_average
  end

  def ops
    _pretty_float object.ops
  end

  def player_name
    [object.player.surname, object.player.given_name].join(', ')
  end

  private

  def _pretty_float num
    "%.4f" % num.to_f
  end
end
