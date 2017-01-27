def bundle_install
  puts 'Cheking bundler ...'

  log = system('bundle install')
  `gem install bundler` if (!log)
  `bundle install`
end