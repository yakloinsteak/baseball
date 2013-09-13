class BaseDecorator < Draper::Decorator
  FORMAT = "%.4f"

  private

  def _nil_to_na val
    val.nil? ? 'N/A' : val
  end

  def _pretty_float num
    "%.4f" % num.to_f
  end
end
