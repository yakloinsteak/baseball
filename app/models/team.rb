class Team < ActiveRecord::Base
  belongs_to :division
  has_many :contracts
  has_many :players, through: :contracts
end
