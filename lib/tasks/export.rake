namespace :export do
  desc "Export database"
  task :data do
    cmds = []
    cmds << "PGPASSWORD=#{ENV['PGPASSWORD']} pg_dump -Fc --no-acl --no-owner -h localhost -U blackman demo4_dev > baseball.dump"
    cmds << "scp baseball.dump linode:/var/www/baseball.dump"
    cmds << "heroku pgbackups:restore DATABASE 'http://#{ENV['IP']}/baseball.dump' --confirm rocky-ravine-7055"
    cmds.each do |cmd|
      puts cmd
      system cmd
    end
  end
end
