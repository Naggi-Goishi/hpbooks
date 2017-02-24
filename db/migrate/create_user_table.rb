require_relative '../db_table'

table_name = 'users'
colums = {
  password: :string,
  email: :string,
  first_name: :string,
  middle_name: :string,
  last_name: :string
}

DB_Table.new(table_name, colums);
