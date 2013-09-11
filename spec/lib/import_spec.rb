require 'spec_helper'

describe Import do
  let(:path)           { File.join(Rails.root, 'spec', 'fixtures', 'stats.xml') }
  before(:each)        { Import.new(path).execute }
  let(:team)           { Team.first }
  let(:division)       { Division.first }
  let(:player)         { Player.order(:surname).first }
  let(:incomplete_player) { Player.order(:surname).second }
  let(:league)         { League.first }

  it "should import correct number leagues" do
    League.count.should == 1
  end

  it "should import correct number divisions" do
    Division.count.should == 1
  end

  it "should import correct number teams" do
    Team.count.should == 1
  end

  it "should import correct number players" do
    Player.count.should == 2
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
    player.position.should == 'Second Base'
  end

  it "should import player team" do
    player.teams.first.name.should == 'Braves'
  end

  it "should import player stats" do
    player.stats.first.at_bats.should == 28
    player.stats.first.caught_stealing.should == 0
    player.stats.first.doubles.should == 1
    player.stats.first.batting_errors.should == 0
    player.stats.first.games.should == 11
    player.stats.first.games_started.should == 8
    player.stats.first.hit_by_pitch.should == 0
    player.stats.first.hits.should == 5
    player.stats.first.home_runs.should == 1
    player.stats.first.pb.should == 0
    player.stats.first.rbi.should == 1
    player.stats.first.runs.should == 3
    player.stats.first.sacrifice_flies.should == 0
    player.stats.first.sacrifice_hits.should == 0
    player.stats.first.steals.should == 0
    player.stats.first.struck_out.should == 2
    player.stats.first.triples.should == 0
    player.stats.first.walks.should == 2
    player.stats.first.year.should == 1998
  end

  it "should treat a lack of stats as zero" do
    incomplete_player.stats.first.at_bats.should == 0
    incomplete_player.stats.first.caught_stealing.should == 0
    incomplete_player.stats.first.doubles.should == 0
    incomplete_player.stats.first.batting_errors.should == 0
    incomplete_player.stats.first.games.should == 0
    incomplete_player.stats.first.games_started.should == 0
    incomplete_player.stats.first.hit_by_pitch.should == 0
    incomplete_player.stats.first.hits.should == 0
    incomplete_player.stats.first.home_runs.should == 0
    incomplete_player.stats.first.pb.should == 0
    incomplete_player.stats.first.rbi.should == 0
    incomplete_player.stats.first.runs.should == 0
    incomplete_player.stats.first.sacrifice_flies.should == 0
    incomplete_player.stats.first.sacrifice_hits.should == 0
    incomplete_player.stats.first.steals.should == 0
    incomplete_player.stats.first.struck_out.should == 0
    incomplete_player.stats.first.triples.should == 0
    incomplete_player.stats.first.walks.should == 0
  end
end
