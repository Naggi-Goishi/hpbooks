require 'bcrypt'
require_relative '../db/db_model'

class User < DB_Model

  def initialize(attributes = {})
    attributes = attributes.keys_to_sym
    encrypt_password!(attributes)
    attributes = {table_name: 'users', attributes: attributes}
    super attributes
  end

  private
  def encrypt_password!(attributes)
     attributes[:password] = BCrypt::Password.create(attributes[:password])
  end
end