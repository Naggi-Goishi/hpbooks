task default: %w[setup]

task :setup do
  ruby 'bin/setup.rb'
end

task :start do
  ruby 'hpbooks.rb'
end

namespace :db do
  task :migrate do
    ruby 'bin/db/migrate.rb'
  end
end
