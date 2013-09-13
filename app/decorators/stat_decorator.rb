class StatDecorator < BaseDecorator
  delegate_all
  decorates_association :player

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

    val = if object.ops.nil?
      'N/A'
    elsif object.ops >= 0.9000
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
    else
      'Atrocious'
    end

    "<small class='text-muted'>#{val}</small> ".html_safe +  _pretty_float(object.ops)
  end

  #TDB
  def all_as_rows
    parts = object.attributes.map do |key, value|
      next if ['created_at', 'updated_at', 'id', 'player_id', 'year'].include? key
      "<td>#{key.titleize}</td><td>#{_nil_to_na value}</td>"
    end.flatten

    evens = []
    odds = []
    parts.each_with_index do |val,idx|
      evens << val if idx%2==0
      odds << val if idx%2==1
    end

    rows = odds.zip(evens).map do |pair|
      "<tr>" + pair.join + '</tr>'
    end

    rows.join.html_safe
  end
end
