class Stat < ActiveRecord::Base
  include Sortable

  belongs_to :player

  before_save :write_batting_average
  before_save :write_ops

  def batting_average=
    raise NotImplementedError.new('This is a computed and cached value.')
  end

  def ops=
    raise NotImplementedError.new('This is a computed and cached value.')
  end

  private

  def write_batting_average
    write_attribute(:batting_average, BattingAverage.for(self))
  end

  def write_ops
    write_attribute(:ops, OPS.for(self))
  end
end
