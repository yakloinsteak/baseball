namespace :export do
  desc "Export database"
  task :data do
    cmds = []
    cmds << "PGPASSWORD=#{ENV['PGPASSWORD']} pg_dump -Fc --no-acl --no-owner -h localhost -U blackman demo4_dev > demo4.dump"
    cmds << "scp demo4.dump linode:/var/www/demo4.dump"
    cmds << "heroku pgbackups:restore DATABASE 'http://#{ENV['IP']}/demo4.dump' --confirm rocky-ravine-7055"
    cmds.each do |cmd|
      puts cmd
      system cmd
    end
  end
end
