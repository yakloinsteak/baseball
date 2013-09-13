require 'spec_helper'

describe StatDecorator do
  let(:player)         { Player.create! }
  let(:stat)           { Stat.create! }
  let(:decorated_stat) { stat.decorate }

  it "batting average should be truncated but with hover over of full value" do
    stat.stub(:batting_average => 3.14159)
    decorated_stat.batting_average.should == %{<a class="tip" data-toggle="tooltip" href="#" title="3.14159">3.1416</a>}
  end

  context "ops" do
    it "should precede value with description" do
      decorated_stat.ops.should start_with %{<small class='text-muted'>N/A</small>}
    end

    it "should be visually truncated but with hover over of full value" do
      stat.stub(:ops => 3.14159)
      decorated_stat.ops.should end_with(%{<a class="tip" href="#" data-toggle="tooltip" title="3.14159">3.1416</a>})
    end
  end

  context "all stats as two-column rows (all_as_rows)" do
    it "should format two fields per row (four cells)" do
      row_count = decorated_stat._important_fields.count / 2
      Nokogiri::HTML(decorated_stat.all_as_rows).css('tr').count.should == row_count
    end
  end
end
