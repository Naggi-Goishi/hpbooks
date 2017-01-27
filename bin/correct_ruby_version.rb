HPBOOKS_RUBY_VERSION = '2.3.1'

def check_ruby_version
  puts 'Cheking ruby version ...'
  log = `ruby -v`

  if (has_version?(log, HPBOOKS_RUBY_VERSION))
    puts "\nGreat! you are using ruby #{HPBOOKS_RUBY_VERSION}\n"
  else
    puts "\nYou are not using #{HPBOOKS_RUBY_VERSION} ...\n"
    check_rbenv
  end
end

def has_version?(log, version)
  !!Regexp.new(version).match(log)
end

def check_rbenv
  puts 'Cheking rbenv ...'
  log = `rbenv versions`

  if (has_version?(log, HPBOOKS_RUBY_VERSION))
    `rbenv local #{HPBOOKS_RUBY_VERSION}`
    check_ruby_version
  else
    install_ruby
  end
end

def insatll_ruby
  log = system("rbenv install #{HPBOOKS_RUBY_VERSION}")
  check_rbenv
  if (!log)
    raise_error
  end
end

def raise_error
  begin
    raise "\n\ncan not run rbenv install #{HPBOOKS_RUBY_VERSION}\n\n"
  rescue
    puts 'You may need to download rbenv'
    puts 'Try again after installing rbenv'
    puts 'https://github.com/rbenv/rbenv'
  end
end