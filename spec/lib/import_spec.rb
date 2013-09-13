require 'spec_helper'

describe Import do
  def do_import; Import.new(path).execute; end
  let(:path)     { File.join(Rails.root, 'spec', 'fixtures', 'stats.xml') }
  before(:each)  { do_import }
  let(:team)     { Team.order(:name).first }
  let(:division) { Division.order(:name).first }
  let(:player)   { Player.order(:surname).first }
  let(:incomplete_player) { Player.order(:surname).second }
  let(:league)   { League.first }

  it "should import correct number leagues" do
    League.count.should == 1
  end

  it "should import correct number divisions" do
    Division.count.should == 2
  end

  it "should import correct number teams" do
    Team.count.should == 2
  end

  it "should import correct number players" do
    Player.count.should == 3
  end

  it "should import league name" do
    league.name.should == 'National League'
  end

  it "should import division name" do
    division.name.should == 'East'
  end

  it "should import team city and name" do
    team.city.should == 'Atlanta'
    team.name.should == 'Braves'
  end

  it "should import player name" do
    player.surname.should == 'Malloy'
    player.given_name.should == 'Marty'
  end

  it "should import player team" do
    player.teams.order(:name).first.name.should == 'Braves'
  end

  it "should import player stats and sum duplicate players" do
    player.stats.first.at_bats.should == 28*2
    player.stats.first.caught_stealing.should == 0*2
    player.stats.first.doubles.should == 1*2
    player.stats.first.batting_errors.should == 0*2
    player.stats.first.games.should == 11*2
    player.stats.first.games_started.should == 8*2
    player.stats.first.hit_by_pitch.should == 0*2
    player.stats.first.hits.should == 5*2
    player.stats.first.home_runs.should == 1*2
    player.stats.first.pb.should == 0*2
    player.stats.first.rbi.should == 1*2
    player.stats.first.runs.should == 3*2
    player.stats.first.sacrifice_flies.should == 0*2
    player.stats.first.sacrifice_hits.should == 0*2
    player.stats.first.steals.should == 0*2
    player.stats.first.struck_out.should == 2*2
    player.stats.first.triples.should == 0*2
    player.stats.first.walks.should == 2*2
    player.stats.first.year.should == 1998
  end

  it "should treat a lack of stats as undefined in the database" do
    incomplete_player.stats.first.at_bats.should be_nil
    incomplete_player.stats.first.caught_stealing.should be_nil
    incomplete_player.stats.first.doubles.should be_nil
    incomplete_player.stats.first.batting_errors.should be_nil
    incomplete_player.stats.first.games.should be_nil
    incomplete_player.stats.first.games_started.should be_nil
    incomplete_player.stats.first.hit_by_pitch.should be_nil
    incomplete_player.stats.first.hits.should be_nil
    incomplete_player.stats.first.home_runs.should be_nil
    incomplete_player.stats.first.pb.should be_nil
    incomplete_player.stats.first.rbi.should be_nil
    incomplete_player.stats.first.runs.should be_nil
    incomplete_player.stats.first.sacrifice_flies.should be_nil
    incomplete_player.stats.first.sacrifice_hits.should be_nil
    incomplete_player.stats.first.steals.should be_nil
    incomplete_player.stats.first.struck_out.should be_nil
    incomplete_player.stats.first.triples.should be_nil
    incomplete_player.stats.first.walks.should be_nil
  end

  it "should handle players on multiple teams" do
    player.teams.count.should == 2
    player.contracts.count.should == 2
  end

  let(:dual_positions) { player.contracts.order(:position).map(&:position) }
  let(:dual_years)     { player.contracts.map(&:year) }
  it "should associate players' contracts with a year and position" do
    dual_positions.should == ['Second Base', 'Third Base']
    dual_years.should == [1998, 1998]
  end

  context "rerunning" do
    before(:each) { do_import }

    it "should not create duplicate leagues" do
      League.count.should == 1
    end

    it "should not create duplicate divisions" do
      Division.count.should == 2
    end

    it "should not create duplicate teams" do
      Team.count.should == 2
    end

    it "should not create duplicate players" do
      Player.count.should == 3
    end
  end
end
