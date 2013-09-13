class PlayerDecorator < BaseDecorator
  delegate_all

  def title
    name + ' of the ' + team_names
  end

  def modal_link
    h.link_to name, "#player_#{object.id}", title: team_names, :class => [:btn, 'btn-primary', 'btn-xs', 'tip'], "data-toggle" => "modal"
  end

  def team_names
    object.teams.map do |team|
      team.city + ' ' + team.name
    end.to_sentence
  end

  def name
    [object.surname, object.given_name].join(', ')
  end
end
