require 'spec_helper'

describe Searchable do
  describe Stat do
    let!(:stat) { Stat.create! year: Searchable::DEFAULT_YEAR, hits: 1.0, at_bats: 4.0 }

    it "should return correct year" do
      Stat.create! year: Searchable::DEFAULT_YEAR-1
      Stat.search.should include stat
    end

    it "should return correct number of results" do
      Stat.create! year: Searchable::DEFAULT_YEAR-1
      Stat.search.count.should == 1
    end

    it "should return in correct order" do
      Stat.create! year: Searchable::DEFAULT_YEAR, hits: 0.0, at_bats: 10
      Stat.search.first.should == stat
    end

    it "should limit the number of results" do
      Stat.create! year: Searchable::DEFAULT_YEAR
      module Searchable::ClassMethods
        def max_results
          1
        end
      end
      Stat.search.count.should == 1
    end

    it "should place nulls at the end" do
      Stat.connection.execute "insert into stats (year) values (1998)"
      Stat.search.first.should == stat
    end
  end
end
