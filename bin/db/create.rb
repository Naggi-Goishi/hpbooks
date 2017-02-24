require 'mysql2'
require_relative '../../db/load_config'

def create_database
  puts "\nCreate Database #{DEVELOPMENT[:database_name]}"
  client = Mysql2::Client.new(
    host: "#{DEVELOPMENT[:host]}",
    username: "#{DEVELOPMENT[:username]}"
  )
  client.query("CREATE DATABASE #{DEVELOPMENT[:database_name]}")
end
