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

            puts "Created #{player_model.given_name} of the #{team_model.city} #{team_model.name}"

            player_model.teams << team_model

            player_model.stats.create!(
              at_bats: player.at_xpath('AT_BATS').try(:inner_text).to_i,
              caught_stealing: player.at_xpath('CAUGHT_STEALING').try(:inner_text).to_i,
              doubles: player.at_xpath('DOUBLES').try(:inner_text).to_i,
              batting_errors: player.at_xpath('ERRORS').try(:inner_text).to_i,
              games: player.at_xpath('GAMES').try(:inner_text).to_i,
              games_started: player.at_xpath('GAMES_STARTED').try(:inner_text).to_i,
              hit_by_pitch: player.at_xpath('HIT_BY_PITCH').try(:inner_text).to_i,
              hits: player.at_xpath('HITS').try(:inner_text).to_i,
              home_runs: player.at_xpath('HOME_RUNS').try(:inner_text).to_i,
              pb: player.at_xpath('PB').try(:inner_text).to_i,
              rbi: player.at_xpath('RBI').try(:inner_text).to_i,
              runs: player.at_xpath('RUNS').try(:inner_text).to_i,
              sacrifice_flies: player.at_xpath('SACRIFICE_FLIES').try(:inner_text).to_i,
              sacrifice_hits: player.at_xpath('SACRIFICE_HITS').try(:inner_text).to_i,
              steals: player.at_xpath('STEALS').try(:inner_text).to_i,
              struck_out: player.at_xpath('STRUCK_OUT').try(:inner_text).to_i,
              triples: player.at_xpath('TRIPLES').try(:inner_text).to_i,
              walks: player.at_xpath('WALKS').try(:inner_text).to_i,
              year: xml.at_xpath('/SEASON/YEAR').inner_text.to_i
            )
          end
        end
      end
    end
  end

  private

  def puts str
    if Rails.env == 'test'
      Rails.logger.info str
    else
      STDOUT.puts str
    end
  end
end
