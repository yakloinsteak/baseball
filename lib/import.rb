class Import
  attr_reader :xml

  def initialize path
    @path = path
    @xml = Nokogiri::XML(File.open(path))
  end

  def execute
    xml.xpath('/SEASON/LEAGUE').each do |league|

      league_name = league.at_xpath('LEAGUE_NAME').inner_text
      League.create!(name: league_name)

      league.xpath('DIVISION').each do |division|

        division_name = division.at_xpath('DIVISION_NAME').inner_text
        Division.create!(name: division_name)

        division.xpath('TEAM').each do |team|

          team_city = team.at_xpath('TEAM_CITY').inner_text
          team_name = team.at_xpath('TEAM_NAME').inner_text
          team_model = Team.create!(city: team_city, name: team_name)

          team.xpath('PLAYER').each do |player|
            player_surname = player.at_xpath('SURNAME').inner_text
            player_given_name = player.at_xpath('GIVEN_NAME').inner_text
            player_position = player.at_xpath('POSITION').inner_text
            player_model = Player.create!(surname: player_surname, given_name: player_given_name, position: player_position)

            player_model.teams << team_model

            player_model.stats.create!(
              at_bats: player.at_xpath('AT_BATS').inner_text,
              caught_stealing: player.at_xpath('CAUGHT_STEALING').inner_text,
              doubles: player.at_xpath('DOUBLES').inner_text,
              batting_errors: player.at_xpath('ERRORS').inner_text,
              games: player.at_xpath('GAMES').inner_text,
              games_started: player.at_xpath('GAMES_STARTED').inner_text,
              hit_by_pitch: player.at_xpath('HIT_BY_PITCH').inner_text,
              hits: player.at_xpath('HITS').inner_text,
              home_runs: player.at_xpath('HOME_RUNS').inner_text,
              pb: player.at_xpath('PB').inner_text,
              rbi: player.at_xpath('RBI').inner_text,
              runs: player.at_xpath('RUNS').inner_text,
              sacrifice_flies: player.at_xpath('SACRIFICE_FLIES').inner_text,
              sacrifice_hits: player.at_xpath('SACRIFICE_HITS').inner_text,
              steals: player.at_xpath('STEALS').inner_text,
              struck_out: player.at_xpath('STRUCK_OUT').inner_text,
              triples: player.at_xpath('TRIPLES').inner_text,
              walks: player.at_xpath('WALKS').inner_text,
              year: xml.at_xpath('/SEASON/YEAR').inner_text.to_i
            )
          end
        end
      end
    end
  end
end
