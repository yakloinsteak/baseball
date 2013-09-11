class Stat < ActiveRecord::Base
  belongs_to :player

  before_save :write_batting_average

  def batting_average=
    raise NotImplementedError.new('This is a computed and cached value.')
  end

  private

  def write_batting_average
    write_attribute(:batting_average, BattingAverage.for(self))
  end
end
