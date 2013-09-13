require 'spec_helper'

describe StatDecorator do
  let(:player) { Player.create! }
  let(:stat)  { Stat.create! }

  it "batting average should be truncated but with hover over of full value" do
    stat.stub(:batting_average => 3.14159)
    stat.decorate.batting_average.should == %{<a class="tip" data-toggle="tooltip" href="#" title="3.14159">3.1416</a>}
  end

  context "ops" do
    it "should precede value with description" do
      stat.decorate.ops.should start_with %{<small class='text-muted'>N/A</small>}
    end

    it "should be visually truncated but with hover over of full value" do
      stat.stub(:ops => 3.14159)
      stat.decorate.ops.should end_with(%{<a class="tip" href="#" data-toggle="tooltip" title="3.14159">3.1416</a>})
    end
  end

  context "all stats as two-column rows (all_as_rows)" do
    it "should be tested"
  end
end
