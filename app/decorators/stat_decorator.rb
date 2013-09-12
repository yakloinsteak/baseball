class StatDecorator < Draper::Decorator
  delegate_all

  FORMAT = "%.4f"

  def batting_average
    _pretty_float object.batting_average
  end

  def ops
    _pretty_float object.ops
  end

  private

  def _pretty_float num
    "%.4f" % num.to_f
  end
end
