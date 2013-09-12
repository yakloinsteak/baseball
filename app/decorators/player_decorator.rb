class PlayerDecorator < Draper::Decorator
  delegate_all

  def link
    h.link_to player_name, '', title: team_name
  end

  def team_name
    object.team.city + ' ' + object.team.name
  end

  def player_name
    [object.surname, object.given_name].join(', ')
  end
end
