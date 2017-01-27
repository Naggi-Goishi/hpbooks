HPBOOKS_RUBY_VERSION = '2.3.1'

def has_version?(log, version)
  !!Regexp.new(version).match(log)
end

# ruby version
puts 'Cheking ruby version ...'

log = `ruby -v`

if (has_version?(log, HPBOOKS_RUBY_VERSION))
  puts 'Great! you are using ruby 2.3.1'
else
  puts "You are not using #{HPBOOKS_RUBY_VERSION} ..."
  puts 'Cheking rbenv ...'
  log = `rbenv versions`

  if (has_version?(log, HPBOOKS_RUBY_VERSION))
    `rbenv local #{HPBOOKS_RUBY_VERSION}`
  else
    log = system("rbenv install #{HPBOOKS_RUBY_VERSION}")
    if (!log)
      puts 'You may need to download rbenv'
      puts 'Try again after installing rbenv'
      puts 'https://github.com/rbenv/rbenv'
    end
  end
end

# bundler
puts 'Cheking bundler ...'

log = system('bundle install')
`gem install bundler` if (!log)
`bundle install`

puts "\n\n\nYou are all set!"
puts "Start your server with 'ruby hpbooks.rb' and open localhost:4567!!\n\n\n"
