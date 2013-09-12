class PlayerDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

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
