class Import
  attr_reader :xml

  def initialize path
    @path = path
    @xml = Nokogiri::XML(File.open(path))
  end

  def execute
    xml.xpath('/SEASON/LEAGUE').each do |league|

      league_name = league.at_xpath('LEAGUE_NAME').inner_text
      League.find_or_create_by(name: league_name)

      league.xpath('DIVISION').each do |division|

        division_name = division.at_xpath('DIVISION_NAME').inner_text
        Division.find_or_create_by(name: division_name)

        division.xpath('TEAM').each do |team|

          team_city = team.at_xpath('TEAM_CITY').inner_text
          team_name = team.at_xpath('TEAM_NAME').inner_text
          team_model = Team.find_or_create_by(city: team_city, name: team_name)

          team.xpath('PLAYER').each do |player|
            player_surname = player.at_xpath('SURNAME').inner_text
            player_given_name = player.at_xpath('GIVEN_NAME').inner_text
            player_position = player.at_xpath('POSITION').inner_text
            player_model = Player.find_or_create_by(surname: player_surname, given_name: player_given_name, position: player_position)

            puts "Created #{player_model.given_name} of the #{team_model.city} #{team_model.name}"

            player_model.teams << team_model unless player_model.teams.include? team_model

            year = xml.at_xpath('/SEASON/YEAR').inner_text.to_i

            stat = player_model.stats.where(year: year).first

            attrs = {
              year: year,
              at_bats: player.at_xpath('AT_BATS').try(:inner_text),
              balk: player.at_xpath('BALK').try(:inner_text),
              batting_errors: player.at_xpath('ERRORS').try(:inner_text),
              caught_stealing: player.at_xpath('CAUGHT_STEALING').try(:inner_text),
              complete_games: player.at_xpath('COMPLETE_GAMES').try(:inner_text),
              doubles: player.at_xpath('DOUBLES').try(:inner_text),
              earned_runs: player.at_xpath('EARNED_RUNS').try(:inner_text),
              era: player.at_xpath('ERA').try(:inner_text),
              games: player.at_xpath('GAMES').try(:inner_text),
              games_started: player.at_xpath('GAMES_STARTED').try(:inner_text),
              hit_batter: player.at_xpath('HIT_BATTER').try(:inner_text),
              hit_by_pitch: player.at_xpath('HIT_BY_PITCH').try(:inner_text),
              hits: player.at_xpath('HITS').try(:inner_text),
              home_runs: player.at_xpath('HOME_RUNS').try(:inner_text),
              innings: player.at_xpath('INNINGS').try(:inner_text),
              losses: player.at_xpath('LOSSES').try(:inner_text),
              pb: player.at_xpath('PB').try(:inner_text),
              rbi: player.at_xpath('RBI').try(:inner_text),
              runs: player.at_xpath('RUNS').try(:inner_text),
              sacrifice_flies: player.at_xpath('SACRIFICE_FLIES').try(:inner_text),
              sacrifice_hits: player.at_xpath('SACRIFICE_HITS').try(:inner_text),
              saves: player.at_xpath('SAVES').try(:inner_text),
              shut_outs: player.at_xpath('SHUT_OUTS').try(:inner_text),
              steals: player.at_xpath('STEALS').try(:inner_text),
              struck_out_batter: player.at_xpath('STRUCK_OUT_BATTER').try(:inner_text),
              struck_out: player.at_xpath('STRUCK_OUT').try(:inner_text),
              throws: player.at_xpath('THROWS').try(:inner_text),
              triples: player.at_xpath('TRIPLES').try(:inner_text),
              walked_batter: player.at_xpath('WALKED_BATTER').try(:inner_text),
              walks: player.at_xpath('WALKS').try(:inner_text),
              wild_pitches: player.at_xpath('WILD_PITCHES').try(:inner_text),
              wins: player.at_xpath('WINS').try(:inner_text)
            }

            if stat
              stat.update_attributes(attrs)
            else
              player_model.stats.create!(attrs)
            end
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
