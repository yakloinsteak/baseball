class StatDecorator < BaseDecorator
  delegate_all
  decorates_association :player

  def batting_average
    h.link_to _pretty_float(object.batting_average), '#', class: 'tip', data: {toggle: "tooltip"}, title: object.batting_average
  end

  def ops
    (
      "<small class='text-muted'>#{ops_quality}</small> " +
      %{<a class="tip" href="#" data-toggle="tooltip" title="#{object.ops}">#{_pretty_float object.ops}</a>}
    ).html_safe
  end

  def ops_quality
    if object.ops.nil?
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
  end

  def _important_fields
    self.class.column_names - _non_important_fields
  end

  def _non_important_fields
    ['created_at', 'updated_at', 'id', 'player_id', 'year']
  end

  def all_as_rows
    parts = object.attributes.map do |key, value|
      next if _non_important_fields.include? key
      "<td><strong class='label label-default'>#{key.titleize}</strong></td><td>#{_nil_to_na value}</td>"
    end.compact

    _paired_cells_to_rows parts
  end
end
