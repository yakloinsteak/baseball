class StatDecorator < Draper::Decorator
  delegate_all
  decorates_association :player

  FORMAT = "%.4f"

  def batting_average
    _pretty_float object.batting_average
  end

  #TDB
  def ops

    #<span class="label label-default">Default</span>
    #<span class="label label-primary">Primary</span>
    #<span class="label label-success">Success</span>
    #<span class="label label-info">Info</span>
    #<span class="label label-warning">Warning</span>
    #<span class="label label-danger">Danger</span>

    val = if object.ops >= 0.9000
      'Great'
    elsif object.ops > 0.8333
      'Very Good'
    elsif object.ops > 0.7667
      'Above Average'
    elsif object.ops > 0.7000
      'Average'
    elsif object.ops > 0.6334
      'Below Average'
    elsif object.ops > 0.5667
      'Poor'
    elsif object.ops > 0.0
      'Atrocious'
    else
      'N/A'
    end

    _pretty_float(object.ops) + " (#{val})"
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
