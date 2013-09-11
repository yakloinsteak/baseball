require 'spec_helper'

describe BattingAverage do
  let(:player) { OpenStruct.new(hits: @hits, at_bats: @at_bats) }
  let(:ba) { BattingAverage.for(player) }

  it "should be zero if at bats and hits were zero" do
    @hits = @at_bats = 0
    ba.should == 0.0
  end

  it "should divide hits by at bats" do
    @hits = 1
    @at_bats = 2
    ba.should == 0.5
  end
end
