class Team < ActiveRecord::Base
  has_one :division
  has_many :team_players
  has_many :players, through: :team_players
end
