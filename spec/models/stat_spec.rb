require 'spec_helper'

describe Stat do
  context "batting average" do
    it "should be computed" do
      BattingAverage.should_receive(:for)
      Stat.create!(hits: 1, at_bats: 2)
    end

    it "should not be directly settable" do
      expect { Stat.new.batting_average = 10 }.to raise_error
    end
  end
end
