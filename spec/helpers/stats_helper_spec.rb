require 'spec_helper'

describe StatsHelper do
  def set_order_by_param value; helper.params[:order_by] = value; end

  context "sortable_link_to" do
    let(:link_html) { helper.sortable_link_to 'Runs', 'runs desc' }

    it "should create a remote link" do
      link_html.should == '<a data-remote="true" href="/stats.html?order_by=runs+desc">Runs</a>'
    end

    it "should show opposite sort order if sorted ascending" do
      set_order_by_param('runs asc')
      link_html.should == '<a data-remote="true" href="/stats.html?order_by=runs+desc">&uarr;Runs</a>'
    end

    it "should show opposite sort order if sorted descending" do
      set_order_by_param('runs desc')
      link_html.should == '<a data-remote="true" href="/stats.html?order_by=runs+asc">&darr;Runs</a>'
    end

    it "should show sorting in descending order if param sort order is another column" do
      set_order_by_param('something_else asc')
      link_html.should == '<a data-remote="true" href="/stats.html?order_by=runs+desc">Runs</a>'
    end
  end
end
