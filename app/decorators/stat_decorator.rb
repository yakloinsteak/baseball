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

  #TDB
  def all_as_rows
    object.attributes.map do |key, value|
      next if ['created_at', 'updated_at', 'id', 'player_id', 'year'].include? key
      "<tr><td>#{key.titleize}</td><td>#{value}</td></tr>"
    end.flatten.join.html_safe
  end


  private

  def _pretty_float num
    "%.4f" % num.to_f
  end
end
