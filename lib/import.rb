class Import
  attr_reader :xml

  def initialize path
    @xml = Nokogiri::XML(File.open(path))
  end

  def execute
   _for_each_league do |league|
     _for_each_division_of league do |division|
       _for_each_team_of division do |team|
         _for_each_player_of team do |player|
            #TDB: Try running import multiple times and checking
            #TDB: finish cleaning this

            @contract = Contract.find_or_create_by(player: @player_model, team: @team_model, year: year, position: @player_position)

            #@player_model.contracts << @team_model unless @player_model.teams.include? @team_model

            #@player_model.teams << @team_model unless @player_model.teams.include? @team_model

            stat = @player_model.stats.where(year: year).first

            attrs = _get_stats_for player
            attrs[:year] = year

            if stat
              stat.update_attributes(attrs)
            else
              @player_model.stats.create!(attrs)
            end
          end
        end
      end
    end
  end

  def year
    @year ||= _get_node_value(xml, '/SEASON/YEAR')
  end

  private

  def _for_each_league
    xml.xpath('/SEASON/LEAGUE').each do |league|
      league_name = _get_node_value(league, 'LEAGUE_NAME')
      @league_model = League.find_or_create_by(name: league_name)
      yield league
    end
  end

  def _for_each_division_of league
    league.xpath('DIVISION').each do |division|
      division_name = _get_node_value(division, 'DIVISION_NAME')
      @division_model = Division.find_or_create_by(name: division_name, league: @league_model)
      yield division
    end
  end

  def _for_each_team_of division
    division.xpath('TEAM').each do |team|
      team_city = team.at_xpath('TEAM_CITY').inner_text
      team_name = team.at_xpath('TEAM_NAME').inner_text
      @team_model = Team.find_or_create_by(city: team_city, name: team_name, division: @division_model)
      yield team
    end
  end

  def _for_each_player_of team
    team.xpath('PLAYER').each do |player|
      player_surname = player.at_xpath('SURNAME').inner_text
      player_given_name = player.at_xpath('GIVEN_NAME').inner_text
      @player_position = player.at_xpath('POSITION').inner_text
      @player_model = Player.find_or_create_by(surname: player_surname, given_name: player_given_name)

      puts "Created #{@player_model.given_name} of the #{@team_model.city} #{@team_model.name}"
      yield player
    end
  end

  def _get_stats_for player
    {
      at_bats: _get_node_value(player, 'AT_BATS'),
      balk: _get_node_value(player, 'BALK'),
      batting_errors: _get_node_value(player, 'ERRORS'),
      caught_stealing: _get_node_value(player, 'CAUGHT_STEALING'),
      complete_games: _get_node_value(player, 'COMPLETE_GAMES'),
      doubles: _get_node_value(player, 'DOUBLES'),
      earned_runs: _get_node_value(player, 'EARNED_RUNS'),
      era: _get_node_value(player, 'ERA'),
      games: _get_node_value(player, 'GAMES'),
      games_started: _get_node_value(player, 'GAMES_STARTED'),
      hit_batter: _get_node_value(player, 'HIT_BATTER'),
      hit_by_pitch: _get_node_value(player, 'HIT_BY_PITCH'),
      hits: _get_node_value(player, 'HITS'),
      home_runs: _get_node_value(player, 'HOME_RUNS'),
      innings: _get_node_value(player, 'INNINGS'),
      losses: _get_node_value(player, 'LOSSES'),
      pb: _get_node_value(player, 'PB'),
      rbi: _get_node_value(player, 'RBI'),
      runs: _get_node_value(player, 'RUNS'),
      sacrifice_flies: _get_node_value(player, 'SACRIFICE_FLIES'),
      sacrifice_hits: _get_node_value(player, 'SACRIFICE_HITS'),
      saves: _get_node_value(player, 'SAVES'),
      shut_outs: _get_node_value(player, 'SHUT_OUTS'),
      steals: _get_node_value(player, 'STEALS'),
      struck_out_batter: _get_node_value(player, 'STRUCK_OUT_BATTER'),
      struck_out: _get_node_value(player, 'STRUCK_OUT'),
      throws: _get_node_value(player, 'THROWS'),
      triples: _get_node_value(player, 'TRIPLES'),
      walked_batter: _get_node_value(player, 'WALKED_BATTER'),
      walks: _get_node_value(player, 'WALKS'),
      wild_pitches: _get_node_value(player, 'WILD_PITCHES'),
      wins: _get_node_value(player, 'WINS')
    }
  end

  def _get_node_value node, xpath
    node.at_xpath(xpath).try(:inner_text)
  end

  def puts str
    if Rails.env == 'test'
      Rails.logger.info str
    else
      STDOUT.puts str
    end
  end
end
