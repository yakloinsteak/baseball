require 'spec_helper'

describe OPS do
  let(:stats)  { {hits: 3, doubles: 4, triples: 1, home_runs: 6, hit_by_pitch: 1, sacrifice_flies: 3, walks: 1, at_bats: 14} }
  let(:player) { OpenStruct.new(stats) }
  let(:ops)    { OPS.for(player) }

  it "should calculate total bases as hits + 2 * doubles + 3 * triples + 4 * home_runs" do
    OPS.new(player).total_bases.should == 3 + 8 + 3 + 24
  end

  it "should calculate ops" do
    ops.should be_within(0.001).of(2.97744)
  end
end
