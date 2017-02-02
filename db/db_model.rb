require 'mysql2'
require_relative 'load_config'

class DB_Model

  def initialize
    @client = connect
    select_database
  end

  def save(table_name, params)
    @client.query("
          INSERT INTO #{table_name}
          (#{params_keys(params)})
          VALUES
          (#{params_velues(params)});")
  end

  private
  def connect
    Mysql2::Client.new(host: "#{DEVELOPMENT[:host]}", username: "#{DEVELOPMENT[:username]}")
  end

  def select_database
    @client.query("USE #{DEVELOPMENT[:database_name]};")
  end

  def select_database
    @client.query("USE #{DEVELOPMENT[:database_name]};")
  end

  def params_keys(params)
    params.keys.join(',')
  end

  def params_velues(params)
    results = params.values.inject('') do |values, value|
      values += "'#{value}',"
      values
    end
    results[0...-1]
  end
end