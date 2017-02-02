require_relative 'correct_ruby_version'
require_relative 'bundle_install'
require_relative 'db/create'

check_ruby_version
bundle_install
create_database

puts "\n\nYou are all set!"
puts "Start your server with 'ruby hpbooks.rb' and open localhost:4567!!\n\n"
