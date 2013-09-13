class Player < ActiveRecord::Base
  has_many :contracts
  has_many :teams, through: :contracts
  has_many :stats

  def position
    contracts.order(:position).map do |contract|
      contract.position
    end.join('/')
  end
end
