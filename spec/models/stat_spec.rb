require 'spec_helper'

describe Stat do
  before(:each) { BattingAverage.stub(:for) }
  before(:each) { OPS.stub(:for) }

  context "batting average" do
    it "should be computed" do
      BattingAverage.should_receive(:for)
      Stat.create!
    end

    it "should not be directly settable" do
      expect { Stat.new.batting_average = 10 }.to raise_error
    end
  end

  context "ops" do
    it "should be computed" do
      OPS.should_receive(:for)
      Stat.create!
    end

    it "should not be directly settable" do
      expect { Stat.new.ops = 10 }.to raise_error
    end

  end
end
