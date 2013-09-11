require 'spec_helper'

describe Stat do
  context "batting average" do
    it "should be computed" do
      Stat.create!(hits: 1, at_bats: 2)
      Stat.first.batting_average.should == 0.5
    end

    it "should not be directly settable" do
      expect { Stat.new.batting_average = 10 }.to raise_error
    end

    it "should be zero if at bats was zero" do
      Stat.create!(hits: 0, at_bats: 0)
      Stat.first.batting_average.should == 0.0
    end
  end
end
