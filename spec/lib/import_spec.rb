require 'spec_helper'

describe Import do
  let(:path)    { File.join(Rails.root, 'spec', 'fixtures', 'stats.xml') }
  before(:each)  { Import.new(path).execute }
  let(:team)     { Team.first }
  let(:division) { Division.first }
  let(:player)   { Player.first }
  let(:league)   { League.first }

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
    pending "figuring out error column problem" do
      Player.count.should == 1
    end
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
    pending
    player.surname.should == 'Malloy'
    player.given_name.should == 'Marty'
  end

  it "should import player stats" do
    pending
    #<PLAYER><SURNAME>Malloy</SURNAME><GIVEN_NAME>Marty</GIVEN_NAME><POSITION>Second Base</POSITION><GAMES>11</GAMES><GAMES_STARTED>8</GAMES_STARTED><AT_BATS>28</AT_BATS><RUNS>3</RUNS><HITS>5</HITS><DOUBLES>1</DOUBLES><TRIPLES>0</TRIPLES><HOME_RUNS>1</HOME_RUNS><RBI>1</RBI><STEALS>0</STEALS><CAUGHT_STEALING>0</CAUGHT_STEALING><SACRIFICE_HITS>0</SACRIFICE_HITS><SACRIFICE_FLIES>0</SACRIFICE_FLIES><ERRORS>0</ERRORS><PB>0</PB><WALKS>2</WALKS><STRUCK_OUT>2</STRUCK_OUT><HIT_BY_PITCH>0</HIT_BY_PITCH></PLAYER>
  end
end
