namespace :import do
  desc "Import xml"
  task :stats, [:path] => [:environment] do |t, args|
    args.with_defaults(:path => 'db/import/1998statistics.xml')
    #TDB
    Division.destroy_all
    Player.destroy_all
    Stat.destroy_all
    League.destroy_all
    Contract.destroy_all
    Import.new(args[:path]).execute
  end
end
