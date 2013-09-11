namespace :import do
  desc "Import xml"
  task :stats, [:path] => [:environment] do |t, args|
    args.with_defaults(:path => 'db/import/1998statistics.xml')
    Import.new(args[:path]).execute
  end
end
