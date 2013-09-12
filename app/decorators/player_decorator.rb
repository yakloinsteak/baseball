class PlayerDecorator < Draper::Decorator
  delegate_all

  def modal_link
    h.link_to name, "#player_#{object.id}", title: team_name, :class => [:btn, 'btn-primary', 'btn-xs'], "data-toggle" => "modal"
  end

  def team_name
    object.team.city + ' ' + object.team.name
  end

  def name
    [object.surname, object.given_name].join(', ')
  end
end
