task default: %w[setup]

task :setup do
  ruby 'bin/setup.rb'
end

task :start do
  ruby 'hpbooks.rb'
end

task :'db:migrate' do
  ruby 'bin/db/migrate.rb'
end
