require_relative 'correct_ruby_version'
require_relative 'bundle_install'

check_ruby_version
bundle_install

puts "\n\nYou are all set!"
puts "Start your server with 'ruby hpbooks.rb' and open localhost:4567!!\n\n"