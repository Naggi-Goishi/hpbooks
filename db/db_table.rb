require 'mysql2'
require_relative 'db_model'

class Symbol
  def to_sql
    case self
    when :integer
      return 'INTEGER'
    when :string
      return 'VARCHAR(100)'
    when :text
      return 'VARCHAR(1000)'
    end
  end
end

class DB_Table < DB_Model
  def initialize(table_name, columns)
    super()
    @table = {name: table_name, columns: parseTable(columns)}
    @client.query("
      CREATE TABLE #{@table[:name]} (
        id MEDIUMINT NOT NULL AUTO_INCREMENT,
        #{@table[:columns]},
        primary key(id)
        );")
  end

  private

  def parseTable(columns)
    columns = columns.inject('') do |table, (key, value)|
      table += "#{key} #{value.to_sql}, "
      table
    end
    columns[0...-2]
  end
end
