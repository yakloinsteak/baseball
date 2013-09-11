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
          Team.create!(city: team_city, name: team_name)

          team.xpath('PLAYER').each do |player|
            Player.create!
          end
        end
      end
    end
  end
end
